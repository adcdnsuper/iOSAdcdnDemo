//
//  ADCDN_GameBoxListViewController.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/4/2.
//  Copyright © 2020 pst. All rights reserved.
//

#import "ADCDN_GameBoxListViewController.h"
#import "ADCDN_SDKKey.h"
#import "ADCDN_GameBoxViewController.h"
#import "ADCDN_GameBoxListFirstCollectionViewCell.h"
#import "ADCDN_GameBoxListSecondCollectionViewCell.h"

#import <ADCDN/ADCDN.h>

@interface ADCDN_GameBoxListViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

/* 列表 */
@property (nonatomic,strong) UICollectionView *listCV;
/* modelArr */
@property (nonatomic,strong) NSMutableArray *modelArr;
@end

@implementation ADCDN_GameBoxListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self listCV];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 请求游戏数据
    [self requestGameList];
}
#pragma mark - 游戏数组
-(NSMutableArray *)modelArr{
    if (!_modelArr) {
        _modelArr = [NSMutableArray new];
    }
    return _modelArr;
}
#pragma mark - 获取游戏数据
-(void)requestGameList{
    ADCDN_GameBoxModel *model = [ADCDN_GameBoxModel new];
    model.userSystem = 1;
    model.userId = @"123456";
    model.nickname = @"我的昵称";
    model.avatar = @"https://dss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2131257963,3457119996&fm=58";
    model.existNav = 1;
    model.rootViewController = self;
    __weak typeof(self) weakSelf = self;
    ADCDN_GameBoxGamesTool *gameTool = [ADCDN_GameBoxGamesTool shareManager];
    [gameTool getWithModel:model gameBoxBlock:^(NSMutableArray<ADCDN_GameBoxGamesModel *> *modelArr) {
        NSLog(@"%@",modelArr);
        weakSelf.modelArr = modelArr;
        [weakSelf.listCV reloadData];
    }];
}

#pragma mark - collectionView
-(UICollectionView *)listCV{
    if (!_listCV) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        _listCV = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _listCV.bounces = NO;
        _listCV.delegate = self;
        _listCV.dataSource = self;
        _listCV.backgroundColor = K_HexColor(0xF6F6F6);
        [self.view addSubview:_listCV];
        [self registerCellAndHeader];
    }
    return _listCV;
}
#pragma mark - 注册cell和header
-(void)registerCellAndHeader{
    // cell
    [self.listCV registerClass:[ADCDN_GameBoxListFirstCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ADCDN_GameBoxListFirstCollectionViewCell class])];
    
    [self.listCV registerClass:[ADCDN_GameBoxListSecondCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ADCDN_GameBoxListSecondCollectionViewCell class])];
}
#pragma mark - cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        ADCDN_GameBoxListSecondCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ADCDN_GameBoxListSecondCollectionViewCell class]) forIndexPath:indexPath];
        cell.gameModerArr = self.modelArr;
        // 点击更多游戏
        cell.didMoreGameBlock = ^{
            self.navigationController.navigationBarHidden = NO;
            ADCDN_GameBoxViewController *vc = [ADCDN_GameBoxViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        };
        // 点击cell中的游戏
        cell.didCellBlock = ^(NSIndexPath *indexPath) {
            if ([self.modelArr[indexPath.row] isKindOfClass:[ADCDN_GameBoxGamesModel class]]) {
                 ADCDN_GameBoxGamesModel *model = self.modelArr[indexPath.row];
                ADCDN_GameBoxGamesTool *gameTool = [ADCDN_GameBoxGamesTool shareManager];
                 [gameTool didGameWithModel:model withViewController:self];
            }
        };
        return cell;
    }
    else{
        ADCDN_GameBoxListFirstCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ADCDN_GameBoxListFirstCollectionViewCell class]) forIndexPath:indexPath];
        cell.indexPath = indexPath;
        return cell;
    }
}


#pragma mark - sectionNumber
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 5;
}
#pragma mark - itemNumber
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return 1;
}
#pragma mark - item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 2) {
       // 游戏开关
        ADCDN_GameBoxGamesTool *gameTool = [ADCDN_GameBoxGamesTool shareManager];
        if ([[gameTool getScenesSwitch] isEqualToString:@"1"]) {
            CGFloat imgW  = (ScreenW - K_Width(60) * 4)/4.0;
            CGFloat cellH = imgW + K_Height(76) + K_Height(60);
            if (self.modelArr.count > 0) {
                return CGSizeMake(ScreenW, cellH);
            }
            return CGSizeMake(ScreenW, K_Height(60));
            
        }
        else{
            return CGSizeMake(0.1, 0.01);
        }
    }
    else{
        return CGSizeMake(ScreenW, K_Height(150));
    }
    
}
#pragma mark - item的横向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
#pragma mark - item的纵向间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
@end
