//
//  HSHomeHeaderView.m
//  haochang
//
//  Created by 侯帅 on 2016/11/10.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSHomeHeaderView.h"
#import "SDCycleScrollView.h"
#import "HSHomeBtn.h"
#import "HSHomeAdModel.h"
@interface HSHomeHeaderView()<SDCycleScrollViewDelegate>

@property (nonatomic,strong)SDCycleScrollView *adScrollView;
@property (nonatomic,strong)NSMutableArray *arrayHomeAd;
@end

@implementation HSHomeHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self createAdScrollView];
        [self loadHomeAdData];
        
    }
    return self;
}

-(void)loadHomeAdData{
    HSparameters;
    parameters[@"_time"] = [HSManager hs_getTime];
    parameters[@"isFirst"] = @"0";
    parameters[@"_sign"] = @"8f4cc87b23a54e969eea3cbdcea7a9da";
    [HSHttpRequest hs_getClearAPIName:API_HomeAD parameters:parameters succes:^(id dic) {
//        [dic writeToFile:@"/Users/yihaoshangquan/Desktop/plist文件/home_ad.plist" atomically:YES];
        //解析模型
        self.arrayHomeAd = [HSHomeAdModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"ads"]];
        //找到图片广告数组
        NSMutableArray *arrayAdImageUrl = [NSMutableArray array];
        for (HSHomeAdModel *model in self.arrayHomeAd) {
            if ([model.position isEqualToString:@"home"]) {
                [arrayAdImageUrl addObject:model.image];
            }
        }
        self.adScrollView.imageURLStringsGroup = arrayAdImageUrl;
    } error:^(id error) {
        
    }];
}

-(void)createAdScrollView{
    self.adScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150) delegate:self placeholderImage:ImagePlaceholderBig];
    [self addSubview:self.adScrollView];
    
    HSHomeBtn *btn1 = [HSHomeBtn buttonWithType:UIButtonTypeCustom];
    HSHomeBtn *btn2 = [HSHomeBtn buttonWithType:UIButtonTypeCustom];
    UIView *lineView = [[UIView alloc]init];
    [self addSubview:btn1];
    [self addSubview:btn2];
    [self addSubview:lineView];
    
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.height.mas_equalTo(44);
        make.right.mas_equalTo(lineView.mas_left).mas_equalTo(0);
    }];
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.height.with.mas_equalTo(btn1);
        make.left.mas_equalTo(lineView.mas_right).mas_equalTo(0);
    }];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-3);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(38);
    }];
    
    
    [btn1 setImage:[UIImage imageNamed:@"homepage_area_36x36_"] forState:UIControlStateNormal];
    [btn1 setTitle:@"地区&全国各地麦霸" forState:UIControlStateNormal];
    [btn2 setImage:[UIImage imageNamed:@"homepage_newsong_36x36_"] forState:UIControlStateNormal];
    [btn2 setTitle:@"新歌&最新歌曲动态" forState:UIControlStateNormal];
    
    
    
    
    
    
    //底部分割线
    UIView *bottomLineView = [[UIView alloc]init];
    bottomLineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:bottomLineView];
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
    
    
    
}

-(NSMutableArray *)arrayHomeAd{
    if (!_arrayHomeAd) {
        _arrayHomeAd = [NSMutableArray array];
    }
    return _arrayHomeAd;
}

@end
