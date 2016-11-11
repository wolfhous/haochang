//
//  HSHomeAdModel.h
//  haochang
//
//  Created by 壹号商圈 on 16/11/11.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSHomeAdModel : NSObject
/** id*/
@property (nonatomic,copy)NSString *adId;
/** 图片地址*/
@property (nonatomic,copy)NSString *image;
/** link字典*/
@property (nonatomic,strong)NSDictionary *link;
/** 名称*/
@property (nonatomic,copy)NSString *name;
/** position*/
@property (nonatomic,copy)NSString *position;
/** 序号*/
@property (nonatomic,copy)NSString *rank;
/** version*/
@property (nonatomic,copy)NSString *version;
@end
