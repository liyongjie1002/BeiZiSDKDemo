//
//  BeiZiInterstitialViewController.m
//  BeiZiSDKDemo
//
//  Created by Arthur on 2021/7/8.
//

#import "BeiZiInterstitialViewController.h"
#import <BeiZiSDK/BeiZiSDK.h>

@interface BeiZiInterstitialViewController () <BeiZiInterstitialDelegate>

@property (nonatomic, strong) BeiZiInterstitial *interstitial;

@end

@implementation BeiZiInterstitialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.interstitial = [[BeiZiInterstitial alloc]initWithSpaceID:@"103461" spaceParam:@"" lifeTime:5000];
    self.interstitial.delegate = self;
    
    //加载开屏广告
    [self.interstitial BeiZi_loadInterstitialAd];
}

/**
 插屏加载成功
 */
- (void)BeiZi_interstitialDidReceiveAd:(BeiZiInterstitial *)beiziInterstitial {
    [self.interstitial BeiZi_showInterstitialAdFromRootViewController:self];
}

/**
 插屏展现
 */
- (void)BeiZi_interstitialDidPresentScreen:(BeiZiInterstitial *)beiziInterstitial {
    
}

/**
 插屏点击
 */
- (void)BeiZi_interstitialDidClick:(BeiZiInterstitial *)beiziInterstitial {
    
}

/**
 插屏消失&&关闭
 */
- (void)BeiZi_interstitialDidDismissScreen:(BeiZiInterstitial *)beiziInterstitial {
    
}

/**
 插屏请求失败
 */
- (void)BeiZi_interstitial:(BeiZiInterstitial *)beiziInterstitial didFailToLoadAdWithError:(BeiZiRequestError *)error {
    NSLog(@"插屏失败：%@", error);
}

@end
