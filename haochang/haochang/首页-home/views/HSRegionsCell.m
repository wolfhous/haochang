//
//  HSRegionsCell.m
//  haochang
//
//  Created by 侯帅 on 2016/11/11.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSRegionsCell.h"

@implementation HSRegionsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.imageView1.layer.masksToBounds = YES;
    self.imageView1.layer.cornerRadius = self.imageView1.xmg_width/2;
    self.imageView2.layer.masksToBounds = YES;
    self.imageView2.layer.cornerRadius = self.imageView1.xmg_width/2;
    self.imageView3.layer.masksToBounds = YES;
    self.imageView3.layer.cornerRadius = self.imageView1.xmg_width/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setHomeRegionsModelmodel:(HSHomeRegionsModel *)homeRegionsModelmodel{
    _homeRegionsModelmodel = homeRegionsModelmodel;
    //设置序号
    self.labelNumber.text = homeRegionsModelmodel.rank;
    if (homeRegionsModelmodel.rank.integerValue <= 3) {
        [self.labelNumber hs_setRoundRadius:self.labelNumber.xmg_width/2 borderWidth:0 borderColor:nil bgColor:HSMainColor textColor:[UIColor whiteColor] fontSize:17];
    }else{
        [self.labelNumber hs_setRoundRadius:self.labelNumber.xmg_width/2 borderWidth:0 borderColor:nil bgColor:[UIColor whiteColor] textColor:HSMainColor fontSize:17];
    }
    //设置城市
    self.labelCity.text = homeRegionsModelmodel.name;
    CGRect rect = [homeRegionsModelmodel.name boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    self.labelCIityW.constant = rect.size.width + 2;
    //设置分数
    self.labelScore.text = [NSString stringWithFormat:@"%@分",homeRegionsModelmodel.indexNumber];
    
    //设置右边图片显示
    if (homeRegionsModelmodel.topSinger.count == 3) {
        [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:homeRegionsModelmodel.topSinger[0][@"avatar"][@"mini"]] placeholderImage:ImagePlaceholderMini];
        [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:homeRegionsModelmodel.topSinger[1][@"avatar"][@"mini"]] placeholderImage:ImagePlaceholderMini];
        [self.imageView3 sd_setImageWithURL:[NSURL URLWithString:homeRegionsModelmodel.topSinger[2][@"avatar"][@"mini"]] placeholderImage:ImagePlaceholderMini];
    }else if (homeRegionsModelmodel.topSinger.count == 2){
        [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:homeRegionsModelmodel.topSinger[0][@"avatar"][@"mini"]] placeholderImage:ImagePlaceholderMini];
        [self.imageView3 sd_setImageWithURL:[NSURL URLWithString:homeRegionsModelmodel.topSinger[1][@"avatar"][@"mini"]] placeholderImage:ImagePlaceholderMini];
    }else if (homeRegionsModelmodel.topSinger.count == 1){
        [self.imageView3 sd_setImageWithURL:[NSURL URLWithString:homeRegionsModelmodel.topSinger[0][@"avatar"][@"mini"]] placeholderImage:ImagePlaceholderMini];
    }
    
    
}

@end
