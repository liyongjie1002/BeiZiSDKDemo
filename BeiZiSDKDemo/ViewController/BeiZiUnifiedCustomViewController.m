//
//  BeiZiUnifiedCustomViewController.m
//  BeiZiSDKDemo
//
//  Created by Cookie on 2022/3/28.
//

#import "BeiZiUnifiedCustomViewController.h"
#import <BeiZiSDK/BeiZiSDK.h>

@interface BeiZiUnifiedCustomViewController () <BeiZiUnifiedCustomDelegate>

@property (nonatomic, strong) BeiZiUnifiedCustom *cunstom;

@end

@implementation BeiZiUnifiedCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.cunstom = [[BeiZiUnifiedCustom alloc]initWithSpaceID:@"104631" spaceParam:@"" lifeTime:5000];
    self.cunstom.delegate = self;
    [self.cunstom BeiZi_loadUnifiedCustomAd];
}

- (void)BeiZi_unifiedDidLoadSuccess:(BeiZiUnifiedCustom *)unifiedCustom {
    NSLog(@"Cookie：互动卡片请求成功");
    [self.cunstom BeiZi_showUnifiedCustomAdWithViewController:self];
}

/**
 新开屏展现
 */
- (void)BeiZi_unifiedDidPresentScreen:(BeiZiUnifiedCustom *)unifiedCustom {
    NSLog(@"Cookie：互动卡片显示");
}

/**
 新开屏点击
 */
- (void)BeiZi_unifiedDidClick:(BeiZiUnifiedCustom *)unifiedCustom {
    NSLog(@"Cookie：互动卡片点击");
}

/**
 新开屏已经消失
 */
- (void)BeiZi_unifiedDidDismissScreen:(BeiZiUnifiedCustom *)unifiedCustom {
    NSLog(@"Cookie：互动卡片关闭");
}

/**
 新开屏请求失败
 */
- (void)BeiZi_unified:(BeiZiUnifiedCustom *)unifiedCustom didFailToLoadAdWithError:(BeiZiRequestError *)error {
    NSLog(@"Cookie：互动卡片失败：%@", error);
}

@end
