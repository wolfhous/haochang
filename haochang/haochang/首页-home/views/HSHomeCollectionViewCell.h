//
//  HSHomeCollectionViewCell.h
//  haochang
//
//  Created by 侯帅 on 2016/11/10.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSHomeCellModel.h"
@interface HSHomeCollectionViewCell : UICollectionViewCell
/** 图片*/
@property (weak, nonatomic) IBOutlet UIImageView *imageViewHeader;
/** 标题*/
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
/** 昵称*/
@property (weak, nonatomic) IBOutlet UILabel *labelNickName;
/** 城市*/
@property (weak, nonatomic) IBOutlet UILabel *labelCity;
/** <#注释语#>*/

/** 显示的模型*/
@property (nonatomic,strong)HSHomeCellModel *homeCellModel;

@end
