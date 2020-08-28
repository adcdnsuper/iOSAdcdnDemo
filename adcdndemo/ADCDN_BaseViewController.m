//
//  ADCDN_BaseViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/8/17.
//  Copyright © 2020 pst. All rights reserved.
//

#import "ADCDN_BaseViewController.h"

@interface ADCDN_BaseViewController ()

@end

@implementation ADCDN_BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}
#pragma mark - 加载广告
-(UIBarButtonItem *)loadAdBtnItem{
    if (!_loadAdBtnItem) {
        UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"加载广告" style:UIBarButtonItemStylePlain target:self action:@selector(loadAd)];
        self.navigationItem.rightBarButtonItem = button;
    }
    return _loadAdBtnItem;
}
#pragma mark - 展示loading
-(void)showLoading{
    [self.view adcdn_showLoading];
    self.view.userInteractionEnabled = NO;
}
#pragma mark - 移除loading
-(void)removeLoading{
    [self.view adcdn_removeLoading];
    self.view.userInteractionEnabled = YES;
}
#pragma mark - 加载广告
-(void)loadAd{}

@end
