//
//  HSMeCellModel.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/2.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSMeCellModel.h"

@implementation HSMeCellModel
-(instancetype)initTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName{
    self = [super init];
    if (self) {
        self.title = title;
        self.subTitle = subTitle;
        self.imageName = imageName;
    }
    return self;
}
@end
