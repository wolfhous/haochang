//
//  HSManager.h
//  duobao
//
//  Created by hou on 16/7/12.
//  Copyright © 2016年 houshuai. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@interface HSManager : NSObject

//管理类 最好不要再此添加属性或者成员变量，请移步单例

/** 检测网络*/
+(void)hs_getExistenceNetwork;

/**检测网络，返回一个布尔值*/
+(BOOL)hs_isExistenceNetwork;

/** 判断是否为手机号码*/
+ (BOOL)hs_isPhone:(NSString *)phoneStr;


/**
 *  浏览头像效果
 *
 *  @param selectedImageView 头像所在的imageView
 */
+ (void)hs_showBigImage:(UIImageView *)selectedImageView;

/**
 *  时间戳转时间字符串
 *
 *  @param str 传入的时间戳
 *
 *  @return 返回的时间字符串
 */
+(NSString *)hs_getTimeForDataStr:(NSString *)str;








/**
 *  截屏返回图片
 *
 *  @param rect 传入需要截取的范围
 *
 *  @return 返回截好的图片
 */
+(UIImage *)hs_captureScreeWithCGRect:(CGRect)rect;












@end
