//
//  HSHomeCellModel.h
//  haochang
//
//  Created by 壹号商圈 on 16/11/11.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSHomeCellScoreModel : NSObject
@property (nonatomic,copy)NSString *art;
@property (nonatomic,copy)NSString *hot;
@end


@interface HSHomeCellLocationModel : NSObject
@property (nonatomic,copy)NSString *city;
@property (nonatomic,copy)NSString *latitude;
@property (nonatomic,copy)NSString *longitude;
@property (nonatomic,copy)NSString *province;
@end
@interface HSHomeCellAvatarModel : NSObject
@property (nonatomic,copy)NSString *middle;
@property (nonatomic,copy)NSString *mini;
@property (nonatomic,copy)NSString *original;
@property (nonatomic,copy)NSString *small;
@end

@interface HSHomeCellSingerModel : NSObject
@property (nonatomic,copy)NSString *avatar;
@property (nonatomic,strong)NSArray *honor;
@property (nonatomic,strong)HSHomeCellLocationModel *location;
@property (nonatomic,copy)NSString *nickname;
@property (nonatomic,copy)NSString *userId;
@end







@interface HSHomeCellModel : NSObject
@property (nonatomic,copy)NSString *isChorus;
@property (nonatomic,copy)NSString *isMV;

@property (nonatomic,copy)NSString *previousRank;

@property (nonatomic,copy)NSString *rank;

@property (nonatomic,strong)NSDictionary *score;

@property (nonatomic,strong)NSDictionary *singer;

@property (nonatomic,copy)NSString *songId;
@property (nonatomic,copy)NSString *title;
@end



