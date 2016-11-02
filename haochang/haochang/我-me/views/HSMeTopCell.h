//
//  HSMeTopCell.h
//  haochang
//
//  Created by 壹号商圈 on 16/11/2.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSMeTopCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userPhotoImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userIdLabel;
@property (weak, nonatomic) IBOutlet UIImageView *accessImageView;
//没有登录显示的
@property (weak, nonatomic) IBOutlet UILabel *isLoginLabel;



@property (nonatomic,assign)BOOL isLogin;

@end
