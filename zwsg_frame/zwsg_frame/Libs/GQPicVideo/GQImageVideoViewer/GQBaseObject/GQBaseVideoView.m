//
//  GQBaseVideoView.m
//  GQImageVideoViewerDemo
//
//  Created by 高旗 on 16/9/12.
//  Copyright © 2016年 gaoqi. All rights reserved.
//

#import "GQBaseVideoView.h"
#import "GQImageVideoViewerConst.h"

@interface GQBaseVideoView()

@property (nonatomic, strong) UIActivityIndicatorView *indicator;//加载指示器

@property (nonatomic, strong) AVPlayerLayer *playerLayer;//播放视图载体

@end

@implementation GQBaseVideoView

GQ_DYNAMIC_PROPERTY_BOOL(isExitObserver, setIsExitObserver);

#pragma mark -- privateMethod

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        [self configureVideoView];
        _state = GQBaseVideoViewStateConfigure;
        _isRepeat = YES;
    }
    return self;
}

- (void)configureVideoView {
    
}

-(void)showLoading
{
    if (!_indicator) {
        _indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        _indicator.center = CGPointMake(self.bounds.origin.x+(self.bounds.size.width/2), self.bounds.origin.y+(self.bounds.size.height/2));
        [_indicator setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleTopMargin];
    }
    if (!_indicator.isAnimating||_indicator.hidden) {
        _indicator.hidden = NO;
        if(!_indicator.superview){
            [self addSubview:_indicator];
        }
        [_indicator startAnimating];
    }
}

-(void)hideLoading
{
    if (_indicator) {
        [_indicator stopAnimating];
        _indicator.hidden = YES;
    }
}

- (void)addObserver
{
    //判断是否已经添加KVO和存在父视图
    if (![self isExitObserver]&&self.superview)
    {
        //KVO
        [self setIsExitObserver:YES];
        [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionInitial context:nil];
        [_player addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld|NSKeyValueObservingOptionInitial context:nil];
        [[NSNotificationCenter defaultCenter] addObserverForName:AVPlayerItemPlaybackStalledNotification object:_playerItem queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * note) {
            [self showLoading];
        }];
        [[NSNotificationCenter defaultCenter] addObserverForName:AVPlayerItemDidPlayToEndTimeNotification object:_playerItem queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * note) {
//            [_player seekToTime:kCMTimeZero];
//            [self play];
            // 重复播放
            [self repeatPlay];
        }];
        [_playerItem addObserver:self forKeyPath:@"playbackBufferEmpty" options:NSKeyValueObservingOptionNew context:nil];
        [_playerItem addObserver:self forKeyPath:@"playbackLikelyToKeepUp" options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)removeObserver
{
    if ([self isExitObserver])
    {
        [self setIsExitObserver:NO];
        [_playerItem removeObserver:self forKeyPath:@"status"];
        [_playerItem removeObserver:self forKeyPath:@"playbackBufferEmpty"];
        [_playerItem removeObserver:self forKeyPath:@"playbackLikelyToKeepUp"];
        [_player removeObserver:self forKeyPath:@"status"];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:_playerItem];
         [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemPlaybackStalledNotification object:_playerItem];
        _playerItem = nil;
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"status"]&&object == _playerItem)
    {
        AVPlayerItemStatus status = _playerItem.status;
        switch (status) {
            case AVPlayerItemStatusReadyToPlay:
            {
                //判断_player的status是否是准备播放
                if (_player.status == AVPlayerStatusReadyToPlay) {
                    _state = GQBaseVideoViewStateReadyToPlay;
//                    [self hideLoading];
                    [self play];
                }
                break;
            }
            case AVPlayerItemStatusFailed:
            {
                _state = GQBaseVideoViewStateFail;
                [self hideLoading];
                break;
            }
            default:
                _state = GQBaseVideoViewStateBuffer;
                break;
        }
    }else if ([keyPath isEqualToString:@"status"]&&object == _player)
    {
        AVPlayerStatus stadus = _player.status;
        switch (stadus) {
            //判断_playerItem的status是否为准备播放
            case AVPlayerStatusReadyToPlay:{
                if (_playerItem.status == AVPlayerItemStatusReadyToPlay)
                {
                    _state = GQBaseVideoViewStateReadyToPlay;
//                    [self hideLoading];
                    [self play];
                }
                break;
            }
            case AVPlayerStatusFailed:{
                _state = GQBaseVideoViewStateFail;
                [self hideLoading];
                break;
            }
            default:
                _state = GQBaseVideoViewStateBuffer;
                break;
        }
    }else if ([keyPath isEqualToString:@"playbackBufferEmpty"]&&object == _playerItem) { //监听播放器在缓冲数据的状态
        if (_playerItem.playbackBufferEmpty) {
            [self showLoading];
        }
    } else if ([keyPath isEqualToString:@"playbackLikelyToKeepUp"]&&object == _playerItem) {
        if (_playerItem.playbackLikelyToKeepUp){
            [self hideLoading];
        }
    }
}


/**
 释放播放器
 */
- (void)releasePlayer {
    
    [self.playerLayer removeFromSuperlayer];
    [self.player.currentItem cancelPendingSeeks];
    [self.player.currentItem.asset cancelLoading];
    [self.player replaceCurrentItemWithPlayerItem:nil];
    _player = nil;
    self.playerLayer = nil;
}

/**
 重复播放
 */
- (void)repeatPlay {
    
    if (_isRepeat) {
        [_player seekToTime:kCMTimeZero];
        [self play];
    }
}

#pragma mark -- Object lifecycle

- (void)layoutSubviews {
    self.frame = self.bounds;
    self.playerLayer.frame = self.layer.bounds;
}

- (void)removeFromSuperview
{
    [self removeObserver];
    [super removeFromSuperview];
}

- (void)dealloc
{
    
    [self hideLoading];
    
    // 释放播放器
    [self releasePlayer];
    
//    [self.playerLayer removeFromSuperlayer];
//    [self.player.currentItem cancelPendingSeeks];
//    [self.player.currentItem.asset cancelLoading];
//    [self.player replaceCurrentItemWithPlayerItem:nil];
//    _player = nil;
//    self.playerLayer = nil;
}

#pragma mark -- publicMethod

- (void)puase
{
    [self hideLoading];
    _state = GQBaseVideoViewStatePuase;
    [self.player pause];
}

- (void)play
{
    if (_player.status ==AVPlayerStatusReadyToPlay && _playerItem.status == AVPlayerItemStatusReadyToPlay) {
        if (_player) {
            [_player play];
            _state = GQBaseVideoViewStatePlaying;
            return;
        }
    }
    _state = GQBaseVideoViewStateBuffer;
}

- (void)replace
{
    [self.player.currentItem cancelPendingSeeks];
    [self.player.currentItem.asset cancelLoading];
    [self.player seekToTime:kCMTimeZero];
    [self.player pause];
    _state = GQBaseVideoViewStateStop;
}

- (void)stop
{
    [self hideLoading];
    [self.player replaceCurrentItemWithPlayerItem:nil];
    _state = GQBaseVideoViewStateStop;
}

#pragma mark -- set get method

- (void)setItem:(NSURL *)item
{
    _state = GQBaseVideoViewStateConfigure;
    //判断之前播放的url地址是否一致
    if ([_item.absoluteString isEqualToString:item.absoluteString]&&_player.currentItem)
    {
//        //如果一致并且_playerItem的status是准备播放时就直接播放
//        if (_playerItem.status == AVPlayerItemStatusReadyToPlay&&_player.status == AVPlayerStatusReadyToPlay)
//        {
//            [self play];
//            return;
//        }
        
        // 如果item一致就直接跳出，可以直接播放
        return;
    }
    
    // 移除观察者
    [self removeObserver];
    // 释放播放器，用来解决重用导致的上次视频画面残留
    [self releasePlayer];
    
    // 设置新的播放器和playerItem
    _item = [item copy];
    
    [self showLoading];
    
    //重置_playerItem
    _playerItem = [[AVPlayerItem alloc] initWithURL:_item];
    
    _player = [AVPlayer playerWithPlayerItem:_playerItem];
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
    self.playerLayer.frame = self.layer.bounds;
    [self.layer insertSublayer:_playerLayer atIndex:0];
    
    //添加KVO
    [self addObserver];
}

@end
