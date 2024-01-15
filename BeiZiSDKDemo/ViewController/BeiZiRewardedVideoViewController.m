//
//  BeiZiRewardedVideoViewController.m
//  BeiZiSDKDemo
//
//  Created by Arthur on 2021/7/8.
//

#import "BeiZiRewardedVideoViewController.h"
#import <BeiZiSDK/BeiZiSDK.h>

@interface BeiZiRewardedVideoViewController () <BeiZiRewardedVideoDelegate>

@property (nonatomic, strong) BeiZiRewardedVideo *rewardedVideo;

@end

@implementation BeiZiRewardedVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.rewardedVideo = [[BeiZiRewardedVideo alloc]initWithSpaceID:@"103232" spaceParam:@"" lifeTime:10000];
    self.rewardedVideo.delegate = self;
    [self.rewardedVideo BeiZi_loadRewardedVideoAd];
}

/**
 激励视频物料请求成功
 */
- (void)BeiZi_rewardedVideoDidReceiveAd:(BeiZiRewardedVideo *)beiziRewardedVideo {
    NSLog(@"激励视频物料请求成功!!!!!");
    [self.rewardedVideo BeiZi_showRewardedVideoAdFromRootViewController:self];
}

/**
 激励视频开始播放
 */
- (void)BeiZi_rewardedVideoDidStartPlay:(BeiZiRewardedVideo *)beiziRewardedVideo {
    NSLog(@"激励视频开始播放!!!!!");
}

/**
 激励视频点击
 */
- (void)BeiZi_rewardedVideoDidClick:(BeiZiRewardedVideo *)beiziRewardedVideo {
    NSLog(@"激励视频点击!!!!!");
}

/**
 激励视频消失
 */
- (void)BeiZi_rewardedVideoDidDismissScreen:(BeiZiRewardedVideo *)beiziRewardedVideo {
    NSLog(@"激励视频消失!!!!!");
}

/**
 激励视频请求失败
 */
- (void)BeiZi_rewardedVideo:(BeiZiRewardedVideo *)beiziRewardedVideo didFailToLoadAdWithError:(BeiZiRequestError *)error {
    NSLog(@"激励视频请求失败%@!!!!!", error);
}


- (void)BeiZi_rewardedVideo:(BeiZiRewardedVideo *)beiziRewardedVideo didRewardUserWithReward:(NSObject *)reward  {
    NSLog(@"发奖励了兄弟！！！%@----%@", reward, [NSThread currentThread]);
}

- (void)dealloc {
    NSLog(@"激励视频销毁BeiZiRewardedVideoViewController");
}

@end
