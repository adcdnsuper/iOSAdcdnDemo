//
//  ADCDN_GameBoxListFirstCollectionViewCell.m
//  ADCDN_APP
//
//  Created by 彭双塔 on 2020/4/2.
//  Copyright © 2020 pst. All rights reserved.
//

#import "ADCDN_GameBoxListFirstCollectionViewCell.h"
#import "ADCDN_SDKKey.h"
#import "UIFont+ADCDN_APPFont.h"

@interface ADCDN_GameBoxListFirstCollectionViewCell()

/* name */
@property (nonatomic,strong) UILabel *nameLab;

@end
@implementation ADCDN_GameBoxListFirstCollectionViewCell
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
    [self nameLab];
    self.contentView.backgroundColor = K_HexColor(0xF6F6F6);
}
- (void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
    self.nameLab.text = [NSString stringWithFormat:@"第%ld行的内容",indexPath.section];
}
-(UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width - K_Width(30), self.contentView.frame.size.height)];
        _nameLab.font = [UIFont myCustomFont:K_Width(40)];
        _nameLab.textAlignment = 1;
        _nameLab.textColor = [UIColor blackColor];
        [self.contentView addSubview:_nameLab];
    }
    return _nameLab;
}
@end
