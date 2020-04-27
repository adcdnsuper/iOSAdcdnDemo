//
//  ADCDN_GameBoxListCollectionReusableView.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/4/2.
//  Copyright © 2020 pst. All rights reserved.
//

#import "ADCDN_GameBoxListCollectionReusableView.h"
#import "ADCDN_SDKKey.h"
#import "UIFont+ADCDN_APPFont.h"

@interface ADCDN_GameBoxListCollectionReusableView()

/* 游戏大厅 */
@property (nonatomic,strong)UILabel *nameLab;
/* 查看更多 */
@property (nonatomic,strong)UILabel *moreLab;
/* 箭头 */
@property (nonatomic,strong)UIImageView *arrowImg;
/* 按钮 */
@property (nonatomic,strong)UIButton *gameMoreBtn;

/* cellW */
@property (nonatomic,assign) CGFloat cellW;
/* cellH */
@property (nonatomic,assign) CGFloat cellH;


@end


@implementation ADCDN_GameBoxListCollectionReusableView
#pragma mark - 初始化
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // UI
        self.cellH = self.frame.size.height;
        self.cellW = self.frame.size.width;
        [self initUI];
    }
    return self;
}
#pragma mark - UI
-(void)initUI{
    [self nameLab];
    [self moreLab];
    [self arrowImg];
    [self gameMoreBtn];
}
-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(K_Width(33), 0,self.cellW/2.0 ,self.cellH)];
        _nameLab.font = [UIFont myCustomFont:K_Width(30)];
        _nameLab.textColor = [UIColor blackColor];
        _nameLab.text = @"游戏大厅";
        [self addSubview:_nameLab];
    }
    return _nameLab;
}
-(UILabel *)moreLab{
    if (!_moreLab) {
        _moreLab = [[UILabel alloc] initWithFrame:CGRectMake(self.cellW - K_Width(40) -  K_Width(12) - K_Width(200) -K_Width(8), 0,K_Width(200) ,self.cellH)];
        _moreLab.font = [UIFont myCustomFont:K_Width(30)];
        _moreLab.textColor = [UIColor blackColor];
        _moreLab.textAlignment = 2;
        _moreLab.text = @"查看更多";
        [self addSubview:_moreLab];
    }
    return _moreLab;
}
-(UIImageView *)arrowImg{
    if (!_arrowImg) {
        
        _arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(self.cellW - K_Width(40) -  K_Width(12), 0, K_Width(12), self.cellH)];
        _arrowImg.contentMode = UIViewContentModeScaleAspectFit;
        _arrowImg.image = [UIImage imageNamed:@"arrows"];
        [self addSubview:_arrowImg];
    }
    return _arrowImg;
}
-(UIButton *)gameMoreBtn{
    if (!_gameMoreBtn) {
        _gameMoreBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.cellW/2.0, 0, self.cellW/2.0, self.cellH)];
        [_gameMoreBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_gameMoreBtn];
    }
    return _gameMoreBtn;
}
-(void)btnClicked:(UIButton *)button{
    if (self.didBtnBlock) {
        self.didBtnBlock();
    }
}

@end
