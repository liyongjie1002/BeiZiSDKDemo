//
//  BeiZiSDKDemoUITests.m
//  BeiZiSDKDemoUITests
//
//  Created by Arthur on 2021/7/8.
//

#import <XCTest/XCTest.h>

@interface BeiZiSDKDemoUITests : XCTestCase

@end

@implementation BeiZiSDKDemoUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // UI tests must launch the application that they test.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[[[XCTApplicationLaunchMetric alloc] init]] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

- (void)testSplashAd {
    for (int i = 0; i < 10000; i++) {
        [[[XCUIApplication alloc] init] launch];
        sleep(10);
        XCUIApplication *app = [[XCUIApplication alloc] init];
        for (int i = 0; i < 10; i++) {
            sleep(5);
            [app.tables.cells.staticTexts[@"开屏广告"] tap];
            sleep(10);
            [app.navigationBars[@"BeiZiSplashView"].buttons[@"Back"] tap];
        }
    }
}

- (void)testLaunchApp {
    for (int i = 0; i < 10000; i++) {
        [[[XCUIApplication alloc] init] launch];
        sleep(10);
    }
}

@end
