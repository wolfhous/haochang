//
//  HSMeTopCell.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/2.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSMeTopCell.h"

@implementation HSMeTopCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //头像圆角
    [self.imageView hs_setRoundRadius:25];
    //是否登录
    [self setIsLogin:[HSUserSingleton sharedHSUserSingleton].isLogin];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setIsLogin:(BOOL)isLogin{
    _isLogin = isLogin;
    //是否登录
    if ([HSUserSingleton sharedHSUserSingleton].isLogin) {
        self.isLoginLabel.hidden = YES;
        self.userIdLabel.hidden = NO;
        self.userNameLabel.hidden = NO;
        self.userPhotoImageView.hidden = NO;
        self.accessImageView.hidden = NO;
    }else{
        
        self.isLoginLabel.hidden = NO;
        self.userIdLabel.hidden = YES;
        self.userNameLabel.hidden = YES;
        self.userPhotoImageView.hidden = YES;
        self.accessImageView.hidden = YES;
    }
}

@end
