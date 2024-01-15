//
//  AppDelegate.m
//  BeiZiSDKDemo
//
//  Created by Arthur on 2021/7/8.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import <BeiZiSDK/BeiZiSDK.h>
#import <objc/runtime.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>
#import <AdSupport/AdSupport.h>

@interface AppDelegate () <BeiZiSplashDelegate>

@property (nonatomic, strong) BeiZiSplash *splash;

@end

@implementation AppDelegate

// 调试-IOS   20825      开屏：104833       原生：106043
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [BeiZiSDKManager configureWithApplicationID:@"20825"]; //20689
    self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    [self.window makeKeyAndVisible];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        // 2.0秒后异步追加任务代码到主队列，并开始执行
//        NSLog(@"after---%@",[NSThread currentThread]);  // 打印当前线程
//        [self createSplash];
//    });
    [self createSplash];

    return YES;
}

- (void)createSplash {
    self.splash = [[BeiZiSplash alloc]initWithSpaceID:@"104833" spaceParam:@"" lifeTime:5000]; //104569
    self.splash.delegate = self;
    self.splash.showLaunchImage = YES;
    [self.splash BeiZi_loadSplashAd];// 使用此方法加载开屏
}

- (void)BeiZi_splashDidLoadSuccess:(BeiZiSplash *)beiziSplash {
    NSLog(@"Cookie:规定时间内广告请求成功");
    //主线程
    [self.splash BeiZi_showSplashAdWithWindow:self.window];
}

- (UIView *)BeiZi_splashBottomView {
    CGFloat width = MIN([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    CGFloat height = MAX([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    UIView *view = [[UIView alloc]init];
    if (width/height > 0.5) {
        view.frame = CGRectMake(0, 0, width, height - width/2*3);
    } else {
        view.frame = CGRectMake(0, 0, width, height - width/9*16);
    }
    view.backgroundColor = [UIColor orangeColor];
    return view;
}

/**
 开屏展现
 */
- (void)BeiZi_splashDidPresentScreen:(BeiZiSplash *)beiziSplash {
    if (self.splash.isZoomOutAd) {
        [self.splash BeiZi_showZoomOutSplashAdWithController:[UIApplication sharedApplication].delegate.window.rootViewController];
    }
    NSLog(@"Cookie:开屏展示");
}
/**
 开屏点睛点击
 */
- (void)BeiZi_splashZoomOutDidClick:(BeiZiSplash *)beiziSplash {
    
}

/**
 开屏点睛关闭
 */
- (void)BeiZi_splashZoomOutDidClose:(BeiZiSplash *)beiziSplash {
    _splash = nil;
//    _splash.delegate = nil;
}

/**
 开屏点击
 */
- (void)BeiZi_splashDidClick:(BeiZiSplash *)beiziSplash {
    NSLog(@"Cookie:开屏点击");
}

/**
 开屏即将消失
 */
- (void)BeiZi_splashWillDismissScreen:(BeiZiSplash *)beiziSplash {
    NSLog(@"Cookie:开屏即将消失");
}

/**
 开屏消失
 */
- (void)BeiZi_splashDidDismissScreen:(BeiZiSplash *)beiziSplash {
    NSLog(@"Cookie:开屏消失");
    if (!self.splash.isZoomOutAd) {
        _splash = nil;
//        _splash.delegate = nil;
    }
}

- (void)BeiZi_splashAdLifeTime:(int)lifeTime {
    NSLog(@"Cookie:开屏倒计时%d", lifeTime);
}

/**
 开屏请求失败
 */
- (void)BeiZi_splash:(BeiZiSplash *)beiziSplash didFailToLoadAdWithError:(BeiZiRequestError *)error {
    NSLog(@"Cookie:规定时间内广告请求失败---开屏失r败---查看控制台打印时间");
    NSLog(@"Cookie:%@", error);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    if (@available(iOS 14, *)) {
        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
        }];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
