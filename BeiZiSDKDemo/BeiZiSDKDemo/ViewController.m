//
//  ViewController.m
//  BeiZiSDKDemo
//
//  Created by Arthur on 2021/7/8.
//

#import "ViewController.h"
#import "BeiZiSplashViewController.h"
#import "BeiZiNativeViewController.h"
#import "BeiZiRewardedVideoViewController.h"
#import "BeiZiBannerViewController.h"
#import "BeiZiFullscreenVideoViewController.h"
#import "BeiZiDrawFlowViewController.h"
#import "BeiZiInterstitialViewController.h"
#import "BeiZiNativeInterstitialViewController.h"
#import "BeiZiUnifiedCustomViewController.h"
#import "BeiZiUnifiedNativeViewController.h"

static NSString * const kListTableViewCell = @"kListTableViewCell";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * mainTableView;
@property (nonatomic, strong) NSArray * vcArray;
@property (nonatomic, strong) NSArray * nameArray;

@end

@implementation ViewController

- (BOOL)shouldAutorotate {
    return NO;
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainTableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BeiZiSplashViewController *viewController = [[BeiZiSplashViewController alloc]init];
        [self.navigationController pushViewController:viewController animated:YES];
    }else if (indexPath.row == 1) {
        BeiZiNativeViewController *nvc = [[BeiZiNativeViewController alloc] init];
        [self.navigationController pushViewController:nvc animated:YES];
    }else if (indexPath.row == 2) {
        BeiZiRewardedVideoViewController *rvc = [[BeiZiRewardedVideoViewController alloc] init];
        [self.navigationController pushViewController:rvc animated:YES];
    }else if (indexPath.row == 3) {
        BeiZiBannerViewController *rvc = [[BeiZiBannerViewController alloc] init];
        [self.navigationController pushViewController:rvc animated:YES];
    }else if (indexPath.row == 4) {
        BeiZiFullscreenVideoViewController *rvc = [[BeiZiFullscreenVideoViewController alloc] init];
        [self.navigationController pushViewController:rvc animated:YES];
    }else if (indexPath.row == 5) {
        BeiZiDrawFlowViewController *rvc = [[BeiZiDrawFlowViewController alloc] init];
        [self.navigationController pushViewController:rvc animated:YES];
    }else if (indexPath.row == 6) {
        BeiZiInterstitialViewController *rvc = [[BeiZiInterstitialViewController alloc] init];
        [self.navigationController pushViewController:rvc animated:YES];
    }else if (indexPath.row == 7) {
        BeiZiNativeInterstitialViewController *rvc = [[BeiZiNativeInterstitialViewController alloc] init];
        [self.navigationController pushViewController:rvc animated:YES];
    } else if (indexPath.row == 8) {
        BeiZiUnifiedCustomViewController *rvc = [[BeiZiUnifiedCustomViewController alloc] init];
        [self.navigationController pushViewController:rvc animated:YES];
    } else if (indexPath.row == 9) {
        BeiZiUnifiedNativeViewController *rvc = [[BeiZiUnifiedNativeViewController alloc] init];
        [self.navigationController pushViewController:rvc animated:YES];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kListTableViewCell forIndexPath:indexPath];
    cell.textLabel.text = self.nameArray[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nameArray.count;
}

#pragma 懒加载
- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) style:UITableViewStylePlain];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kListTableViewCell];
        _mainTableView.tableFooterView = [UIView new];
    }
    return _mainTableView;
}

- (NSArray *)nameArray {
    if (!_nameArray) {
        _nameArray = @[@"开屏广告", @"原生广告", @"激励视频广告", @"banner广告", @"全屏视频广告", @"DrawFlow广告", @"插屏广告",@"原生插屏广告" ,@"自定义广告" ,@"自渲染广告"];
    }
    return _nameArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
