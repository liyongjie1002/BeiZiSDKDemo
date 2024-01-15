//
//  BeiZiDrawFlowViewController.m
//  BeiZiSDKDemo
//
//  Created by Arthur on 2021/7/8.
//

#import "BeiZiDrawFlowViewController.h"
#import <BeiZiSDK/BeiZiSDK.h>

@interface BeiZiDrawFlowViewController () <BeiZiDrawFlowDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) BeiZiDrawFlow *beiziDrawFlow;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *adView;

@end

@implementation BeiZiDrawFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.beiziDrawFlow = [[BeiZiDrawFlow alloc]initWithSpaceID:@"103233" spaceParam:@"" lifeTime:8000];
    self.beiziDrawFlow.delegate = self;
//    self.beiziDrawFlow. = self.view;
    [self.beiziDrawFlow BeiZi_loadDrawFlowAd];
    
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.pagingEnabled = YES;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    [self.adView removeFromSuperview];
    if (indexPath.row == 1) {
        [cell.contentView addSubview:self.adView];;
    }else {
        cell.textLabel.text = @"测试数据";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UIScreen mainScreen].bounds.size.height;
}





- (void)BeiZi_drawFlowManager:(BeiZiDrawFlow *)beiziDrawFlowManager didFailToLoadAdWithError:(BeiZiRequestError *)error {
    NSLog(@"DrawFlow广告加载失败:%@", error);
}

- (void)BeiZi_drawFlowManagerDidLoadSuccess:(BeiZiDrawFlow *)beiziDrawFlowManager {
    UIView *view = self.beiziDrawFlow.channeNativeAdView.firstObject;
    self.adView = view;
    NSLog(@"DrawFlow广告加载成功");
}

- (void)BeiZi_drawAdViewWillShow:(BeiZiDrawFlowView *)drawFlowView {
    NSLog(@"DrawFlow广告即将展现");
}

- (void)BeiZi_drawAdViewVideoDidStart:(BeiZiDrawFlowView *)drawFlowView {
    NSLog(@"DrawFlow广告即将开始播放");
}


- (void)BeiZi_drawAdViewDidClick:(BeiZiDrawFlowView *)drawFlowView {
    NSLog(@"DrawFlow广告被点击");
}

- (void)BeiZi_drawAdViewDidCloseOtherController:(BeiZiDrawFlowView *)drawFlowView {
    NSLog(@"DrawFlow广告详情页关闭");
}


-  (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

@end
