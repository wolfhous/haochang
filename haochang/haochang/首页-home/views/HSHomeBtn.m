//
//  HSHomeBtn.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/11.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSHomeBtn.h"

@implementation HSHomeBtn

-(void)layoutSubviews{
    [super layoutSubviews];
    if (self.titleLabel.text.length < 1) {
        return;
    }
    
    self.imageView.xmg_x = 38;

    self.titleLabel.xmg_x = 44 + self.imageView.xmg_width;
    self.titleLabel.xmg_y = 16;
    self.titleLabel.xmg_height = 30;
    self.titleLabel.numberOfLines = 0;
    
    NSArray *arrayTitle =  [self.titleLabel.text componentsSeparatedByString:@"&"];
    NSString *titleStr = arrayTitle.firstObject;
    NSString *subTitleStr = arrayTitle.lastObject;
    
    NSString *strAll = [NSString stringWithFormat:@"%@\n%@",titleStr,subTitleStr];
    
    NSMutableAttributedString *attStrTitle = [[NSMutableAttributedString alloc]initWithString:strAll];
    [attStrTitle addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor blackColor]} range:NSMakeRange(0, titleStr.length)];
    [attStrTitle addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10],NSForegroundColorAttributeName:[UIColor grayColor]} range:NSMakeRange(strAll.length - subTitleStr.length, subTitleStr.length)];
    
    [self.titleLabel setAttributedText:attStrTitle];
}

@end
