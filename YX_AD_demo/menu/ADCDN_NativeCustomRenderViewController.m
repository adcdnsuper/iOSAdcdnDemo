//
//  ADCDN_NativeCustomRenderViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2019/10/30.
//  Copyright © 2019 pst. All rights reserved.
//

#import "ADCDN_NativeCustomRenderViewController.h"
#import <ADCDN/ADCDN.h>

#import "Tool/ADCDN_StringStyleTool.h"
#import "ADCDN_NativeCustomRenderTableViewCell.h"

@interface ADCDN_NativeCustomRenderViewController ()<ADCDN_NativeCustomRenderAdManagerDelegate,UITableViewDelegate,UITableViewDataSource>

/* ADCDN_NativeCustomRenderAdManager *nativeCustomAd */
@property (nonatomic,strong) ADCDN_NativeCustomRenderAdManager *nativeCustomAd;
/* arr */
@property (nonatomic,copy) NSMutableArray *modelArr;
/* tb */
@property (nonatomic,strong) UITableView *adTableView;

@end

@implementation ADCDN_NativeCustomRenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置view的y值从导航栏以下开始计算为y = 0
//    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
    self.navigationItem.rightBarButtonItem = button;

}
-(UITableView *)adTableView{
    if (!_adTableView) {
        _adTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [self.view addSubview:self.adTableView];
        _adTableView.delegate = self;
        _adTableView.dataSource = self;
        [_adTableView registerClass:[ADCDN_NativeCustomRenderTableViewCell class] forCellReuseIdentifier:@"ADCDN_NativeCustomRenderTableViewCell"];
        [_adTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:@"nodatacell"];
    }
    return _adTableView;
}

-(NSMutableArray *)modelArr{
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
    }
    return _modelArr;
}

#pragma mark - loadAd
-(void)loadAd{
   self.nativeCustomAd = [ADCDN_NativeCustomRenderAdManager shareManagerWithAppId:KappId plcId:self.plcId];
   self.nativeCustomAd.rootViewController = self;
   self.nativeCustomAd.delegate = self;
    // max = 3
   self.nativeCustomAd.adCount = 3;
   [self.nativeCustomAd loadAd];
}

#pragma mark - ADCDN_NativeCustomRenderAdManagerDelegate

/**
*  拉取广告成功
*/
-(void)ADCDN_NativeCustomRenderAdSuccessToLoad:(ADCDN_NativeCustomRenderAdManager *)adsManager nativeAds:(NSArray<ADCDN_NativeCustomRenderModel *> *)nativeAdDataArray{
    if (self.modelArr.count > 0) {
        [self.modelArr removeAllObjects];
    }
    [self.modelArr addObjectsFromArray:nativeAdDataArray];
    [self.adTableView reloadData];
    
}

/**
 *  拉取广告失败
 */
- (void)ADCDN_NativeCustomRenderAd:(ADCDN_NativeCustomRenderAdManager *)nativeExpressAd didFailWithError:(NSError *_Nullable)error{
    NSLog(@"拉取广告失败");
}
/**
 *  点击广告
 */
- (void)ADCDN_NativeCustomRenderAdDidClick:(ADCDN_NativeCustomRenderAdManager *)nativeExpressAd{
    NSLog(@"点击广告");
}
/**
 *  曝光回调
 */
- (void)ADCDN_NativeCustomRenderAdDidBecomeVisible:(ADCDN_NativeCustomRenderAdManager *)nativeExpressAd{
    NSLog(@"曝光回调");
}
/**
 * UITableViewDelegate,UITableViewDataSource
 */
#pragma mark - sectionNumber
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
#pragma mark - rowNumber
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modelArr.count * 5;
}
#pragma mark - cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if (indexPath.row % 5 == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ADCDN_NativeCustomRenderTableViewCell" forIndexPath:indexPath];
        if ([cell isKindOfClass:[ADCDN_NativeCustomRenderTableViewCell class]]) {
            ADCDN_NativeCustomRenderTableViewCell *cells = (ADCDN_NativeCustomRenderTableViewCell *)cell;
            cells.model = [self.modelArr objectAtIndex:indexPath.row / 5];
            [self.nativeCustomAd registerContainer:cell withClickableViews:[self.modelArr objectAtIndex:indexPath.row / 5]];
        }
        return cell;
    } else {
        cell = [self.adTableView dequeueReusableCellWithIdentifier:@"nodatacell" forIndexPath:indexPath];
        cell.textLabel.text = [NSString stringWithFormat:@"第%lu个cell",indexPath.row];
        int r = arc4random() % 255;
        int g = arc4random() % 255;
        int b = arc4random() % 255;
        CGFloat rr = r / 255.0;
        CGFloat rg = g / 255.0;
        CGFloat rb = b / 255.0;
        cell.backgroundColor = [[UIColor alloc]initWithRed:rr green:rg blue:rb alpha:1];
        return cell;
    }
    
    
//    NSString *cellID = NSStringFromClass([ADCDN_NativeCustomRenderTableViewCell class]);
//    ADCDN_NativeCustomRenderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
//    if (cell == nil) {
//        cell = [[ADCDN_NativeCustomRenderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    }
//    cell.model = self.modelArr[indexPath.row];
//    [self.nativeCustomAd registerContainer:cell withClickableViews:self.modelArr[indexPath.row]];
//    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row % 5 == 0) {
        return [ADCDN_NativeCustomRenderTableViewCell cellHeight:[self.modelArr objectAtIndex:indexPath.row / 5]];
    }
    else {
        return 80;
    }
    
}

@end
