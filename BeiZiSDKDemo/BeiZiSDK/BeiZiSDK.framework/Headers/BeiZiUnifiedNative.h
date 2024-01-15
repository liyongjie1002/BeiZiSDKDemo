//
//  BeiZiUnifiedNative.h
//  BeiZiSDK
//
//  Created by Cookie on 2022/7/11.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BeiZiNativeDataObject.h"

NS_ASSUME_NONNULL_BEGIN

@protocol BeiZiUnifiedNativeDelegate;
@class BeiZiRequestError;

@interface BeiZiUnifiedNative : NSObject

@property (nonatomic, copy, readonly) NSString *spaceID;

@property (nonatomic, copy, readonly) NSString *spaceParam;

@property (nonatomic, assign) NSInteger eCPM;
/**
 弹出落地页的需要的控制器
 */
@property (nonatomic, weak) UIViewController *rootViewController;

/**
 用来接收开屏广告读取和展示状态变化通知的 delegate
 */
@property (nonatomic, weak) id <BeiZiUnifiedNativeDelegate> delegate;

/**
 渲染试图数据
 */
@property (nonatomic, strong, readonly) BeiZiNativeDataObject *dataObject;

/**
 图片广告时，将图片添加到此试图上。
 视频广告时，View上已渲染视频。
 */
@property (nonatomic, strong) UIView *materialView;
/**
 设置图片父试图Size，视频Size
 */
@property (nonatomic, assign) CGSize materialViewSize;

/**
 初始化方法
 @param spaceID 广告位 ID
 @param spaceParam 广告位参数 可填写任意字符串
 @param lifeTime 给予广告请求时间
 @return 自定义广告对象
 */
- (instancetype)initWithSpaceID:(NSString *)spaceID
                     spaceParam:(NSString *)spaceParam
                       lifeTime:(uint64_t)lifeTime NS_DESIGNATED_INITIALIZER;

/**
 加载广告
 */
- (void)BeiZi_loadUnifiedNative;

/**
 注册点击事件
 */
- (void)registerContainer:(id)containerView clickableViews:(NSArray<UIView *> *)clickableViews;

/**
 移除引用内容
 */
- (void)BeiZi_removeUnifiedNative;

@end

/**
 代理方法
 */
@protocol BeiZiUnifiedNativeDelegate <NSObject>

@optional
/**
 自定义广告请求成功
 */
- (void)BeiZi_unifiedNativeDidLoadSuccess:(BeiZiUnifiedNative *)unifiedNative;
/**
 自定义展现
 */
- (void)BeiZi_unifiedNativePresentScreen:(BeiZiUnifiedNative *)unifiedNative;

/**
 自定义点击
 */
- (void)BeiZi_unifiedNativeDidClick:(BeiZiUnifiedNative *)unifiedNative;

/**
 自定义详情页关闭
 */
- (void)BeiZi_unifiedNativeDidCloseDetailView:(BeiZiUnifiedNative *)unifiedNative;

/**
 自定义请求失败
 */
- (void)BeiZi_unifiedNative:(BeiZiUnifiedNative *)unifiedNative didFailToLoadAdWithError:(BeiZiRequestError *)error;

@end

NS_ASSUME_NONNULL_END
