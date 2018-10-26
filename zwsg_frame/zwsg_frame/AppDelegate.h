//
//  AppDelegate.h
//  zwsg_frame
//
//  Created by xhb on 2018/8/28.
//  Copyright © 2018年 ZWSG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property(nonatomic,assign) NSMutableDictionary * loginUser;
@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

