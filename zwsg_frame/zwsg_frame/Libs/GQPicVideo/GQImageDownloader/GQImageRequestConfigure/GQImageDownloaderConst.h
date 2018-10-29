//
//  GQImageDownloaderConst.h
//  GQImageDownload
//
//  Created by 高旗 on 2017/11/23.
//  Copyright © 2017年 gaoqi. All rights reserved.
//

#ifndef GQImageDownloaderConst_h
#define GQImageDownloaderConst_h

#import <UIKit/UIKit.h>

#define GQOBJECT_SINGLETON_BOILERPLATE(_object_name_, _shared_obj_name_)    \
static _object_name_ *z##_shared_obj_name_ = nil;                           \
+ (_object_name_ *)_shared_obj_name_ {                                      \
    @synchronized(self) {                                                   \
        if (z##_shared_obj_name_ == nil) {                                  \
            static dispatch_once_t done;                                    \
            dispatch_once(&done, ^{                                         \
            z##_shared_obj_name_ = [[super allocWithZone:nil] init]; });    \
        }                                                                   \
    }                                                                       \
    return z##_shared_obj_name_;                                            \
}                                                                           \
+ (id)allocWithZone:(NSZone *)zone {                                        \
    @synchronized(self) {                                                   \
        if (z##_shared_obj_name_ == nil) {                                  \
            z##_shared_obj_name_ = [super allocWithZone:NULL];              \
            return z##_shared_obj_name_;                                    \
        }                                                                   \
    }                                                                       \
    return nil;                                                             \
}                                                                           \
- (id)copyWithZone:(NSZone*)zone                                            \
{                                                                           \
    return z##_shared_obj_name_;                                            \
}

#if OS_OBJECT_USE_OBJC
    #undef GQDispatchQueueRelease
    #undef GQDispatchQueueSetterSementics
    #define GQDispatchQueueRelease(q)
    #define GQDispatchQueueSetterSementics strong
#else
    #undef GQDispatchQueueRelease
    #undef GQDispatchQueueSetterSementics
    #define GQDispatchQueueRelease(q) (dispatch_release(q))
    #define GQDispatchQueueSetterSementics assign
#endif

#define dispatch_main_async_safe(block)\
if ([NSThread isMainThread]) {\
    block();\
} else {\
    dispatch_async(dispatch_get_main_queue(), block);\
}

//强弱引用
#ifndef GQWeakify
    #define GQWeakify(object) __weak __typeof__(object) weak##_##object = object
#endif

#ifndef GQStrongify
    #define GQStrongify(object) __typeof__(object) object = weak##_##object
#endif

#pragma mark - 动态添加属性
//动态添加属性
#define GQ_DYNAMIC_PROPERTY_OBJECT(_getter_, _setter_, _association_, _type_) \
- (void)_setter_ : (_type_)object { \
    [self willChangeValueForKey:@#_getter_]; \
    objc_setAssociatedObject(self, _cmd, object, _association_); \
    [self didChangeValueForKey:@#_getter_]; \
} \
- (_type_)_getter_ { \
    return objc_getAssociatedObject(self, @selector(_setter_:)); \
}

//动态添加BOOL属性
#define GQ_DYNAMIC_PROPERTY_BOOL(_getter_, _setter_)\
- (void)_setter_:(BOOL)object {\
    [self willChangeValueForKey:@#_getter_]; \
    objc_setAssociatedObject(self, _cmd, @(object), OBJC_ASSOCIATION_ASSIGN); \
    [self didChangeValueForKey:@#_getter_]; \
}\
- (BOOL)_getter_ {\
    return [objc_getAssociatedObject(self, @selector(_setter_:)) boolValue];\
}\

typedef void(^GQImageDownloaderNoParamsBlock)(void);

#endif /* GQImageDownloaderConst_h */
