//
//  ADCDN_GameBoxListItemCollectionViewCell.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/4/18.
//  Copyright © 2020 pst. All rights reserved.
//

#import "ADCDN_GameBoxListItemCollectionViewCell.h"
#import "ADCDN_SDKKey.h"
#import "UIFont+ADCDN_APPFont.h"
#import <ADCDN/ADCDN.h>

@interface ADCDN_GameBoxListItemCollectionViewCell()

/* icon */
@property (nonatomic,strong) UIImageView *iconImg;
/* name */
@property (nonatomic,strong) UILabel *nameLab;
/* imgW */
@property (nonatomic,assign) CGFloat imgW;

@end

@implementation ADCDN_GameBoxListItemCollectionViewCell
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
    self.imgW = (ScreenW - K_Width(29) * 2.0 - K_Width(60) * 4)/4.0;
    [self iconImg];
    [self nameLab];
}
#pragma mark - 游戏图标
-(UIImageView *)iconImg{
    if (!_iconImg) {
        
        _iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(K_Width(32), K_Width(32), self.imgW, self.imgW)];
        _iconImg.contentMode = UIViewContentModeScaleToFill;
        _iconImg.image = [UIImage imageNamed:@"icon_default"];
        [self.contentView addSubview:_iconImg];
    }
    return _iconImg;
}
#pragma mark - 游戏名称
-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, K_Height(48) + self.imgW,self.contentView.frame.size.width , K_Height(30))];
        _nameLab.font = [UIFont myCustomFont:K_Width(28)];
        _nameLab.textAlignment = 1;
        _nameLab.textColor = [UIColor blackColor];
        [self.contentView addSubview:_nameLab];
    }
    return _nameLab;
}

#pragma mark - model
-(void)setModel:(ADCDN_GameBoxGamesModel *)model{
    _model = model;
    self.nameLab.text = model.name;
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.logo]];
    self.iconImg.image = [UIImage imageWithData:imgData];
}
@end
