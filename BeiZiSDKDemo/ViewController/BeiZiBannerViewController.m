//
//  BeiZiBannerViewController.m
//  BeiZiSDKDemo
//
//  Created by Arthur on 2021/7/8.
//

#import "BeiZiBannerViewController.h"
#import <BeiZiSDK/BeiZiSDK.h>

@interface BeiZiBannerViewController ()<BeiZiBannerViewDelegate>

@property (nonatomic, strong) BeiZiBannerView *banner;

@end

@implementation BeiZiBannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.banner = [[BeiZiBannerView alloc] initWithFrame:CGRectMake(0, 200, 400, 65) spaceID:@"103229" spaceParam:@"" lifeTime:5000];
    self.banner.beiziBannerViewController = self;
    self.banner.delegate = self;
    [self.view addSubview:self.banner];
    [self.banner BeiZi_loadBannerAd];
    
}

/**
 Banner加载成功
 */
- (void)BeiZi_bannerDidReceiveAd:(BeiZiBannerView *)beiziBanner {
//    [self.view addSubview:beiziBanner];
}

- (void)BeiZi_banner:(BeiZiBannerView *)beiziBanner didFailToLoadAdWithError:(BeiZiRequestError *)error {
    NSLog(@"%@", error);
}

-(void)BeiZi_bannerDidPresentScreen:(BeiZiBannerView *)beiziBanner {
    NSLog(@"arthur:banner广告曝光");
}

- (void)BeiZi_bannerDislikeDidClick:(BeiZiBannerView *)beiziBanner {
    NSLog(@"arthur:用户点击了不喜欢");
    [self.banner removeFromSuperview];
}

@end
