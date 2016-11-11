//
//  HSHomeRegionsModel.h
//  haochang
//
//  Created by 侯帅 on 2016/11/11.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSHomeRegionsModel : NSObject
/** */
@property (nonatomic,copy)NSString *indexNumber;
/** */
@property (nonatomic,copy)NSString *isNewRecord;
/** */
@property (nonatomic,strong)NSArray *topSinger;
/** 名称*/
@property (nonatomic,copy)NSString *name;
/** */
@property (nonatomic,copy)NSString *previousRank;
/** 序号*/
@property (nonatomic,copy)NSString *rank;
/** */
@property (nonatomic,copy)NSString *rankId;
@end
