//
//  BeiZiNativeViewController.m
//  BeiZiSDKDemo
//
//  Created by Arthur on 2021/7/8.
//

#import "BeiZiNativeViewController.h"
#import <BeiZiSDK/BeiZiNativeExpress.h>

#define SpaceID @"106043"

@interface BeiZiNativeViewController ()<BeiZiNativeExpressDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) BeiZiNativeExpress *nativePress1;

@property (nonatomic, copy) NSString *spaceID;

@property (nonatomic, strong) UITableView *mainTable;

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UIView *adView;

@end

@implementation BeiZiNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainTable];
    
    [self.nativePress1 BeiZi_loadNativeExpressAdWithViewSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0)];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSObject *data = self.dataArray[indexPath.row];
    if ([data isKindOfClass:[NSString class]]) {
        return 70;
    } else {
        return self.adView.frame.size.height;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    id data = [self.dataArray objectAtIndex:indexPath.row];
    if([data isKindOfClass:[NSString class]]){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id" forIndexPath:indexPath];
        cell.textLabel.text = self.dataArray[indexPath.row];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:25];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell_id_ad" forIndexPath:indexPath];
        UIView *adView = (UIView *)data;
        [cell addSubview:adView];
        cell.clipsToBounds = YES;
        return cell;
    }
}


- (BeiZiNativeExpress *)nativePress1{
    if (!_nativePress1){
        _nativePress1 = [[BeiZiNativeExpress alloc]initWithSpaceID:SpaceID spaceParam:@"" lifeTime:5000];
        _nativePress1.beiziNativeViewController = self;
        _nativePress1.delegate = self;
        _nativePress1.adStyle = 2;
    }
    return _nativePress1;
}

- (void)BeiZi_nativeExpressDidLoad:(BeiZiNativeExpress *)beiziNativeExpress{
    UIView *adView = beiziNativeExpress.channeNativeAdView.firstObject;
    if (self.dataArray.count < 12) {
        [self.dataArray insertObject:adView atIndex:4];
    }else {
        [self.dataArray insertObject:adView atIndex:9];
    }
    self.adView = adView;
    [self.mainTable reloadData];
}

- (void)BeiZi_nativeExpressDislikeDidClick:(BeiZiNativeExpress *)beiziNativeExpress{
    [self.adView removeFromSuperview];
    [self.dataArray removeObject:self.adView];
    self.adView = nil;
    [self.mainTable reloadData];
    NSLog(@"Cookie：广告点击关闭");
}

- (void)BeiZi_nativeExpress:(BeiZiNativeExpress *)beiziNativeExpress didFailToLoadAdWithError:(BeiZiRequestError *)error{

    NSLog(@"Cookie: 广告加载失败：%@", error);
}

- (void)BeiZi_nativeExpressDidClick:(BeiZiNativeExpress *)beiziNativeExpress {
    NSLog(@"Cookie：广告点击");
}

- (NSMutableArray *)dataArray{
    if(!_dataArray){
        _dataArray = [[NSMutableArray alloc] init];
        [_dataArray addObjectsFromArray:@[@"原有展示数据1", @"原有展示数据2", @"原有展示数据3", @"原有展示数据4", @"原有展示数据5", @"原有展示数据6", @"原有展示数据7", @"原有展示数据8", @"原有展示数据9", @"原有展示数据10", @"原有展示数据11",]];
    }
    return _dataArray;
}

- (UITableView *)mainTable {
    if (!_mainTable) {
        _mainTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds)) style:UITableViewStyleGrouped];
        _mainTable.delegate = self;
        _mainTable.dataSource = self;
        [_mainTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell_id"];
        [_mainTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell_id_ad"];
//        _mainTable.rowHeight = UITableViewAutomaticDimension;
//        _mainTable.tableFooterView = [UIView new];
    }
    return _mainTable;
}

- (void)dealloc {
    NSLog(@"Cookie：原生销毁");
}

@end
