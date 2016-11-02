//
//  HSMeCellModel.h
//  haochang
//
//  Created by 壹号商圈 on 16/11/2.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSMeCellModel : NSObject
@property (nonatomic,weak)NSString *title;
@property (nonatomic,weak)NSString *subTitle;
@property (nonatomic,weak)NSString *imageName;
-(instancetype)initTitle:(NSString *)title subTitle:(NSString *)subTitle imageName:(NSString *)imageName;
@end
