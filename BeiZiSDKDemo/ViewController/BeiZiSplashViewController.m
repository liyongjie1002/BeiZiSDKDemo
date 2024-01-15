//
//  BeiZiSplashViewController.m
//  BeiZiSDKDemo
//
//  Created by Arthur on 2021/7/8.
//

#import "BeiZiSplashViewController.h"
#import <BeiZiSDK/BeiZiSDK.h>

@interface BeiZiSplashViewController () <BeiZiSplashDelegate>

@property (nonatomic, strong) BeiZiSplash *splash;

@property (nonatomic, assign) BOOL isShow;

@property (nonatomic, strong) UILabel *skipButton;


@end

@implementation BeiZiSplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isShow = NO;
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.splash = [[BeiZiSplash alloc]initWithSpaceID:@"104833" spaceParam:@"" lifeTime:5000]; //104569
    self.splash.delegate = self;
    
    //加载开屏广告
    [self.splash BeiZi_loadSplashAd];
    
    NSLog(@"%ld", (long)[[UIScreen mainScreen] bounds].size.width);
}

- (UIView *)BeiZi_splashBottomView {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 120)];
    view.backgroundColor = [UIColor orangeColor];
    return view;
}

- (void)BeiZi_splashDidLoadSuccess:(BeiZiSplash *)beiziSplash {
//    [self.splash BeiZi_removeSplashAd];
    [self.splash BeiZi_showSplashAdWithWindow:[UIApplication sharedApplication].keyWindow];
}

/**
 开屏展现
 */
- (void)BeiZi_splashDidPresentScreen:(BeiZiSplash *)beiziSplash {
    self.isShow = YES;
    NSLog(@"开屏展现");
}

/**
 开屏点击
 */
- (void)BeiZi_splashDidClick:(BeiZiSplash *)beiziSplash {
    NSLog(@"开屏点击");
}

/**
 开屏消失
 */
- (void)BeiZi_splashDidDismissScreen:(BeiZiSplash *)beiziSplash {
    //  如果开屏不二次创建，并且确定不再使用可置空，也可以忽略
    _splash = nil;
    _splash.delegate = nil;
    NSLog(@"开屏消失");
}

/**
 开屏请求失败
 */
- (void)BeiZi_splash:(BeiZiSplash *)beiziSplash didFailToLoadAdWithError:(BeiZiRequestError *)error {
    _splash = nil;
    _splash.delegate = nil;
    NSLog(@"开屏失败：%@", error);
}

- (void)dealloc {
    NSLog(@"拜拜了您呢开屏");
}

- (void)BeiZi_splashAdLifeTime:(int)lifeTime{
    self.skipButton.text = [NSString stringWithFormat:@"%ds跳过", lifeTime];
}

@end
