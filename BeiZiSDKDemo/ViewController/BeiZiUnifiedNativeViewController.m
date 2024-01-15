//
//  BeiZiUnifiedNativeViewController.m
//  BeiZiSDKDemo
//
//  Created by Cookie on 2022/7/14.
//

#import "BeiZiUnifiedNativeViewController.h"
#import <BeiZiSDK/BeiZiSDK.h>

@interface BeiZiUnifiedNativeViewController () <BeiZiUnifiedNativeDelegate>

@property (nonatomic, strong) BeiZiUnifiedNative *unifiedNative;

@property (nonatomic, strong) UIView *adView;

@property (nonatomic, assign) BOOL isAnimationStart;

@end

@implementation BeiZiUnifiedNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.unifiedNative = [[BeiZiUnifiedNative alloc]initWithSpaceID:@"104834" spaceParam:@"" lifeTime:5000];
    self.unifiedNative.delegate = self;
    self.unifiedNative.materialViewSize = CGSizeMake([UIScreen mainScreen].bounds.size.width-30, 200);
    self.unifiedNative.rootViewController = self;
    [self.unifiedNative BeiZi_loadUnifiedNative];
}

/**
 自定义广告请求成功
 */
- (void)BeiZi_unifiedNativeDidLoadSuccess:(BeiZiUnifiedNative *)unifiedNative {
    NSLog(@"广告请求成功");
    
    NSLog(@"title:%@", unifiedNative.dataObject.title);
    NSLog(@"desc:%@", unifiedNative.dataObject.desc);
    NSLog(@"iconUrl:%@", unifiedNative.dataObject.iconUrl);
    NSLog(@"buttonText:%@", unifiedNative.dataObject.buttonText);
    NSLog(@"imageUrl:%@", unifiedNative.dataObject.imageUrl);
    NSLog(@"imageUrls:%@", unifiedNative.dataObject.imageUrls);
    NSLog(@"isVideoAd:%d", unifiedNative.dataObject.isVideoAd);
    
    self.adView.frame = CGRectMake(0, 200, [UIScreen mainScreen].bounds.size.width, 300);
    self.adView.backgroundColor = [UIColor orangeColor];
    
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-30, 200)];
    NSURL *imageUrl = [NSURL URLWithString:unifiedNative.dataObject.imageUrl];
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    imageV.image = [UIImage imageWithData:imageData];
    imageV.userInteractionEnabled = YES;
    self.unifiedNative.materialView.frame = CGRectMake(15, 15, self.unifiedNative.materialView.frame.size.width, self.unifiedNative.materialView.frame.size.height);
    [self.unifiedNative.materialView addSubview:imageV];
    [self.adView addSubview:self.unifiedNative.materialView];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 230, [UIScreen mainScreen].bounds.size.width-30, 20)];
    titleLabel.text = unifiedNative.dataObject.title;
    [self.adView addSubview:titleLabel];
    
    UILabel *descLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, 250, [UIScreen mainScreen].bounds.size.width-30, 20)];
    descLabel.text = unifiedNative.dataObject.desc;
    [self.adView addSubview:descLabel];
    
    [self.view addSubview:self.adView];
    
    [self.unifiedNative registerContainer:self.adView clickableViews:@[self.adView]];
}

/**
 自定义展现
 */
- (void)BeiZi_unifiedNativePresentScreen:(BeiZiUnifiedNative *)unifiedNative {
    NSLog(@"广告显示");
}

/**
 自定义点击
 */
- (void)BeiZi_unifiedNativeDidClick:(BeiZiUnifiedNative *)unifiedNative {
    NSLog(@"广告点击");
    if (self.isAnimationStart) {
        [self.unifiedNative BeiZi_removeUnifiedNative];
        [self.adView removeFromSuperview];
    } else {
        self.isAnimationStart = YES;
    }
}

/**
 落地页关闭
 */
- (void)BeiZi_unifiedNativeDidCloseDetailView:(BeiZiUnifiedNative *)unifiedNative {
    NSLog(@"落地页关闭");
}

/**
 自定义请求失败
 */
- (void)BeiZi_unifiedNative:(BeiZiUnifiedNative *)unifiedNative didFailToLoadAdWithError:(BeiZiRequestError *)error {
    NSLog(@"广告失败:%@", error);
}

- (UIView *)adView {
    if (!_adView) {
        _adView = [[UIView alloc]init];
    }
    return _adView;
}

- (void)dealloc {
    NSLog(@"销毁");
}

@end
