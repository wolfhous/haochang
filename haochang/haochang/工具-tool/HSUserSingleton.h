//
//  HSUserSingleton.h
//  lkzb
//
//  Created by hou on 16/7/21.
//  Copyright © 2016年 houshuai. All rights reserved.
//  用户数据单例

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singleton.h"
@interface HSUserSingleton : NSObject
singleton_interface(HSUserSingleton)

/** 用户名*/
@property (nonatomic,copy) NSString *userName;
/** 用户密码*/
@property (nonatomic,copy) NSString *userPassword;
/** 用户头像url*/
@property (nonatomic,copy) NSString *userPhoto;
/** 用户id*/
@property (nonatomic,copy) NSString *uid;
/** 当前版本，首页赋值*/
@property (nonatomic,copy)NSString *currentVersion;
/** 商店版本，首页赋值*/
@property (nonatomic,copy)NSString *appStoreVersion;
/** 是否有网络，appdelegate里面就会赋值*/
@property (nonatomic,assign)BOOL isExistenceNetwork;
/** 用户是否已经登录*/
@property (nonatomic,assign)BOOL isLogin;

@end
