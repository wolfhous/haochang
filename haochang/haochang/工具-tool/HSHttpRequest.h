//
//  HSHttpRequest.h
//  httpRequest
//
//  Created by hou on 16/6/13.
//  Copyright © 2016年 houshuai. All rights reserved.

//  所有的接口都写在这里，降低网络数据请求的耦合度

#import <Foundation/Foundation.h>

@interface HSHttpRequest : NSObject

/**
 *  post请求 有提示框
 *
 *  @param apiName    需要请求的API链接
 *  @param parameters 传入的请求参数（可变字典）
 *  @param success    block回调值
 */
+(void)hs_postAPIName:(NSString *)apiName parameters:(NSMutableDictionary *)parameters succes:(void(^)(id responseObject))success error:(void(^)(id error))iserror;
/**
 *  post请求 无提示框
 *
 *  @param apiName    需要请求的API链接
 *  @param parameters 传入的请求参数（可变字典）
 *  @param success    block回调值
 */
+(void)hs_postClearAPIName:(NSString *)apiName parameters:(NSMutableDictionary *)parameters succes:(void(^)(id responseObject))success error:(void(^)(id error))iserror;


/**
 *  post请求 自定义是否有无提示框
 *
 *  @param hideHUD    是否隐藏HUD
 *  @param apiName    需要请求的API链接
 *  @param parameters 传入的请求参数（可变字典）
 *  @param success    block回调值
 */
+(void)hs_postBoolClear:(BOOL)hideHUD withAPIName:(NSString *)apiName parameters:(NSMutableDictionary *)parameters succes:(void(^)(id responseObject))success error:(void(^)(id error))iserror;



@end
