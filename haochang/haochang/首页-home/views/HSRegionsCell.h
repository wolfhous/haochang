//
//  HSRegionsCell.h
//  haochang
//
//  Created by 侯帅 on 2016/11/11.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "HSHomeRegionsModel.h"
@interface HSRegionsCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *labelNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelCity;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelCIityW;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;

@property (nonatomic,strong)HSHomeRegionsModel *homeRegionsModelmodel;

@end
