//
//  BeiZiSDKManager.h
//  BeiZiSDK
//
//  Created by Cookie on 2021/7/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BeiZiSDKManager : NSObject

/**
 配置 AppID
 @param applicationID 商户分配到的唯一appID
 */
+ (void)configureWithApplicationID:(NSString *)applicationID;


+ (void)appChannelString:(NSString *)channelString;

/**
 是否使用个性化推荐广告信息的能力
 @param state YES使用，NO不使用，默认为YES
 */
+ (void)setPersonalRecommend:(BOOL)state;

/**
 开启错误日志
 */
+ (void)openTheBeiZiLog;

/**
 SDK版本号
 @return SDK版本号
 */
+ (NSString *)sdkVersion;


+ (void)openHTTPS:(BOOL)state;

@end

NS_ASSUME_NONNULL_END
