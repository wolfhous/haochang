//
//  HSTabBar.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/1.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//
//record_part_play_14x18_@2x
//record_part_pause_12x18_@3x
#import "HSTabBar.h"

@implementation HSTabBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/





-(void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundColor = [UIColor clearColor];
    for (UIView *subview in self.subviews) {
        [subview removeFromSuperview];
    }
    [self createTabBarView];
}

-(void)createTabBarView{
    UIView *tabbarView = [[UIView alloc]initWithFrame:self.bounds];
    tabbarView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
    [self addSubview:tabbarView];
    
    UIButton *rightBtn1 = [[UIButton alloc]init];
    [rightBtn1 setBackgroundImage:[UIImage imageNamed:@"record_part_play_14x18_"] forState:UIControlStateNormal];
    [tabbarView addSubview:rightBtn1];
    [rightBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(30);
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(0);
    }];
    
    UIButton *rightBtn2 = [[UIButton alloc]init];
    [rightBtn2 setBackgroundImage:[UIImage imageNamed:@"record_part_play_14x18_"] forState:UIControlStateNormal];
    [tabbarView addSubview:rightBtn2];
    [rightBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.mas_equalTo(rightBtn1);
        make.right.mas_equalTo(rightBtn1.mas_left).mas_equalTo(-5);
    }];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"record_part_play_14x18_"]];
    [tabbarView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.centerY.mas_equalTo(rightBtn1);
        make.left.mas_equalTo(20);
    }];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.text = @"titleLabel";
    [tabbarView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(rightBtn2.mas_left).mas_equalTo(0);
        make.left.mas_equalTo(imageView.mas_right).mas_equalTo(5);
        make.height.mas_equalTo(17);
        make.top.mas_equalTo(6);
    }];
    
    UILabel *subTitleLabel = [[UILabel alloc]init];
    subTitleLabel.font = [UIFont systemFontOfSize:11];
    subTitleLabel.text = @"subTitleLabel";
    [tabbarView addSubview:subTitleLabel];
    [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(rightBtn2.mas_left).mas_equalTo(0);
        make.left.mas_equalTo(imageView.mas_right).mas_equalTo(5);
        make.height.mas_equalTo(17);
        make.bottom.mas_equalTo(-6);
    }];
    
}


@end
