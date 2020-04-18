//
//  ADCDN_GameBoxListSecondCollectionViewCell.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/4/2.
//  Copyright © 2020 pst. All rights reserved.
//

#import "ADCDN_GameBoxListSecondCollectionViewCell.h"

#import "ADCDN_GameBoxListItemCollectionViewCell.h"
#import "ADCDN_GameBoxListCollectionReusableView.h"

#import <ADCDN/ADCDN.h>

#import <Masonry.h>

@interface ADCDN_GameBoxListSecondCollectionViewCell()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

/* bgView */
@property (nonatomic,strong) UIView *bgView;
/* collectionview */
@property (nonatomic,strong) UICollectionView *gameCV;
/* gameCV的width */
@property (nonatomic,assign) CGFloat gameCVWidth;


@end
@implementation ADCDN_GameBoxListSecondCollectionViewCell
#pragma mark - 初始化
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // UI
        [self initUI];
    }
    return self;
}
#pragma mark - UI
-(void)initUI{
    self.contentView.backgroundColor = K_HexColor(0xF6F6F6);
    self.gameCVWidth = ScreenW - K_Width(29) * 2.0;
    [self bgView];
    [self gameCV];
}
#pragma mark - bgView
-(UIView *)bgView{
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
        _bgView.layer.cornerRadius = K_Width(8);
        _bgView.layer.masksToBounds = YES;
        [self.contentView addSubview:_bgView];
        __weak typeof(self) weakSelf = self;
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.bottom.mas_equalTo(weakSelf.contentView);
            make.left.mas_equalTo(K_Width(29));
            make.right.mas_equalTo(K_Width(-29));
        }];
    }
    return _bgView;
}

#pragma mark - 数据模型
-(void)setGameModerArr:(NSMutableArray *)gameModerArr{
    _gameModerArr = gameModerArr;
    [self.gameCV reloadData];
}
#pragma mark - collectionView
-(UICollectionView *)gameCV{
    if (!_gameCV) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        _gameCV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _gameCV.bounces = NO;
        _gameCV.delegate = self;
        _gameCV.dataSource = self;
        _gameCV.backgroundColor =
        [UIColor whiteColor];
        [self.bgView addSubview:_gameCV];
        [self registerCellAndHeader];
        //约束
        __weak typeof(self) weakSelf = self;
        [_gameCV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(weakSelf.bgView);
        }];
    }
    return _gameCV;
}
#pragma mark - 注册cell和header
-(void)registerCellAndHeader{
    // 游戏
    [self.gameCV registerClass:[ADCDN_GameBoxListItemCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([ADCDN_GameBoxListItemCollectionViewCell class])];
    
    // header
    [self.gameCV registerClass:[ADCDN_GameBoxListCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([ADCDN_GameBoxListCollectionReusableView class])];
}
/**
 * UICollectionViewDataSource,UICollectionViewDelegate
 */
#pragma mark - cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
     ADCDN_GameBoxListItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ADCDN_GameBoxListItemCollectionViewCell class]) forIndexPath:indexPath];
    if ([self.gameModerArr[indexPath.row] isKindOfClass:[ADCDN_GameBoxGamesModel class]]) {
        ADCDN_GameBoxGamesModel *model = self.gameModerArr[indexPath.row];
        cell.model = model;
    }
    return cell;
}
#pragma mark - sectionHeader
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    ADCDN_GameBoxListCollectionReusableView *headerView = (ADCDN_GameBoxListCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([ADCDN_GameBoxListCollectionReusableView class]) forIndexPath:indexPath];
    __weak typeof(self) weakSelf = self;
    if (self.didMoreGameBlock) {
        headerView.didBtnBlock = ^{
            weakSelf.didMoreGameBlock();
        };
    }
    return headerView;
}

#pragma mark - sectionNumber
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
#pragma mark - itemNumber
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.gameModerArr.count;
}
#pragma mark - section的header大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(ScreenW, K_Height(60));
}
#pragma mark - item的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat imgW  = (self.gameCVWidth - K_Width(60) * 4)/4.0;
    CGFloat cellH = imgW + K_Height(76);
    return CGSizeMake(self.gameCVWidth/4.0, cellH);
}
#pragma mark - 选择item
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didCellBlock) {
        self.didCellBlock(indexPath);
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
