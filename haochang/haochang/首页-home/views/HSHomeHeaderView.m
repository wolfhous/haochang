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
#import "HSRegionViewController.h"
#import "HSSongFreshViewController.h"
#import "HSWebViewController.h"
@interface HSHomeHeaderView()<SDCycleScrollViewDelegate>

@property (nonatomic,strong)SDCycleScrollView *adScrollView;
@property (nonatomic,strong)NSMutableArray *arrayHomeAd;
@end

@implementation HSHomeHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        //创建头部试图
        [self createAdScrollView];
        //加载数据
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
        NSArray *array = [HSHomeAdModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"ads"]];
        for (HSHomeAdModel *model in array) {
            if ([model.position isEqualToString:@"home"]) {
                [self.arrayHomeAd addObject:model];
            }
        }
        //找到图片广告数组
        NSMutableArray *arrayAdImageUrl = [NSMutableArray array];
        for (HSHomeAdModel *model in self.arrayHomeAd) {
            [arrayAdImageUrl addObject:model.image];
        }
        self.adScrollView.imageURLStringsGroup = arrayAdImageUrl;
    } error:^(id error) {
        
    }];
}

-(void)createAdScrollView{
    self.adScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) delegate:self placeholderImage:ImagePlaceholderBig];
    [self addSubview:self.adScrollView];
    
    HSHomeBtn *btnRegion = [HSHomeBtn buttonWithType:UIButtonTypeCustom];
    HSHomeBtn *btnSongFresh = [HSHomeBtn buttonWithType:UIButtonTypeCustom];
    UIView *lineView = [[UIView alloc]init];
    [self addSubview:btnRegion];
    [self addSubview:btnSongFresh];
    [self addSubview:lineView];
    
    
    
    
    [btnRegion mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.mas_equalTo(0);
        make.height.mas_equalTo(65);
        make.right.mas_equalTo(lineView.mas_left).mas_equalTo(0);
    }];
    [btnSongFresh mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(0);
        make.height.with.mas_equalTo(btnRegion);
        make.left.mas_equalTo(lineView.mas_right).mas_equalTo(0);
    }];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(-15);
        make.width.mas_equalTo(1);
        make.height.mas_equalTo(38);
    }];
    
    
    [btnRegion setImage:[UIImage imageNamed:@"homepage_area_36x36_"] forState:UIControlStateNormal];
    [btnRegion setTitle:@"地区&全国各地麦霸" forState:UIControlStateNormal];
    [btnRegion addTarget:self action:@selector(clickRegionBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [btnSongFresh setImage:[UIImage imageNamed:@"homepage_newsong_36x36_"] forState:UIControlStateNormal];
    [btnSongFresh setTitle:@"新歌&最新歌曲动态" forState:UIControlStateNormal];
    [btnSongFresh addTarget:self action:@selector(clickSongFreshBtn) forControlEvents:UIControlEventTouchUpInside];
    
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    //底部分割线
    UIView *bottomLineView = [[UIView alloc]init];
    bottomLineView.backgroundColor = HSrayColor(179);
    [self addSubview:bottomLineView];
    [bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}
//点击地区按钮
-(void)clickRegionBtn{
    HSRegionViewController *regionVc = [HSRegionViewController new];
    [[HSManager he_getCurrentNav] pushViewController:regionVc animated:YES];
}
//点击新歌按钮
-(void)clickSongFreshBtn{
    HSSongFreshViewController *songVc = [HSSongFreshViewController new];
    [[HSManager he_getCurrentNav] pushViewController:songVc animated:YES];
}


/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    HSHomeAdModel *model = self.arrayHomeAd[index];
    HSWebViewController *vc = [[HSWebViewController alloc]initWithUrlString:model.link[@"url"]];
    [[HSManager he_getCurrentNav] pushViewController:vc animated:YES];
}



#pragma mark - 懒加载
-(NSMutableArray *)arrayHomeAd{
    if (!_arrayHomeAd) {
        _arrayHomeAd = [NSMutableArray array];
    }
    return _arrayHomeAd;
}

@end
