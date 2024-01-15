//
//  BeiZiFullscreenVideoViewController.m
//  BeiZiSDKDemo
//
//  Created by Arthur on 2021/7/8.
//

#import "BeiZiFullscreenVideoViewController.h"
#import <BeiZiSDK/BeiZiFullscreenVideo.h>

@interface BeiZiFullscreenVideoViewController () <BeiZiFullscreenVideoDelegate>

@property (nonatomic, strong) BeiZiFullscreenVideo *fullscreenVideo;

@end

@implementation BeiZiFullscreenVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.fullscreenVideo = [[BeiZiFullscreenVideo alloc]initWithSpaceID:@"103231" spaceParam:@"" lifeTime:8000];
    self.fullscreenVideo.delegate = self;
    [self.fullscreenVideo BeiZi_loadFullscreenVideoAd];
    
}

/**
 全屏视频物料请求成功
 */
- (void)BeiZi_fullscreenVideoDidReceiveAd:(BeiZiFullscreenVideo *)beiziFullscreenVideo {
    [self.fullscreenVideo BeiZi_showFullscreenVideoAdFromRootViewController:self];
    NSLog(@"Cookie:全屏料请求成功");
}

/**
 全屏展现并开始播放视频
 */
- (void)BeiZi_fullscreenVideoDidStartPlay:(BeiZiFullscreenVideo *)beiziFullscreenVideo {
    NSLog(@"Cookie:全屏视频开始播放");
}

/**
 全屏视频点击
 */
- (void)BeiZi_fullscreenVideoDidClick:(BeiZiFullscreenVideo *)beiziFullscreenVideo {
    NSLog(@"Cookie:全屏视频点击");
}

/**
 全屏视频消失
 */
- (void)BeiZi_fullscreenVideoDidDismissScreen:(BeiZiFullscreenVideo *)beiziFullscreenVideo {
    NSLog(@"Cookie:全屏视频消失");
}

/**
 全屏视频请求失败
 */
- (void)BeiZi_fullscreenVideo:(BeiZiFullscreenVideo *)beiziFullscreenVideo
   didFailToLoadAdWithError:(BeiZiRequestError *)error {
    NSLog(@"Cookie:%@", error);
}

@end
