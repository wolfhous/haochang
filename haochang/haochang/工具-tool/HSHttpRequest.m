//
//  HSHttpRequest.m
//  httpRequest
//
//  Created by hou on 16/6/13.
//  Copyright © 2016年 houshuai. All rights reserved.
//

#import "HSHttpRequest.h"
#import "AFNetworking.h"//引入头文件afnetworking3.0
@implementation HSHttpRequest

+(void)hs_getAPIName:(NSString *)apiName parameters:(NSMutableDictionary *)parameters succes:(void(^)(id dic))success error:(void(^)(id error))iserror{
    DLog(@"\n【请求接口】\n%@\n【请求参数】\n%@",apiName,parameters);
    //1创建AFHTTPSessionManager 请求管理集
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 5;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    //3设置提示
    [SVProgressHUD show];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];//顶栏状态转圈图形
    //4开始请求
    [manager GET:apiName parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];//顶栏状态转圈图形
        [SVProgressHUD dismiss];
        //请求成功返回数据
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];//顶栏状态转圈图形
        //请求失败
        iserror(error);
        [SVProgressHUD showErrorWithStatus:@"网络连接失败"];
    }];
}
+(void)hs_getClearAPIName:(NSString *)apiName parameters:(NSMutableDictionary *)parameters succes:(void(^)(id dic))success error:(void(^)(id error))iserror{
    DLog(@"\n【请求接口】\n%@\n【请求参数】\n%@",apiName,parameters);
    //1创建AFHTTPSessionManager 请求管理集
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 5;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];//顶栏状态转圈图形
    //4开始请求
    [manager GET:apiName parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];//顶栏状态转圈图形
        //请求成功返回数据
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];//顶栏状态转圈图形
        //请求失败
        iserror(error);
    }];
}
+(void)hs_postClearAPIName:(NSString *)apiName parameters:(NSMutableDictionary *)parameters succes:(void(^)(id responseObject))success error:(void(^)(id error))iserror{
    DLog(@"\n【请求接口】\n%@\n【请求参数】\n%@",apiName,parameters);
    //1创建AFHTTPSessionManager 请求管理集
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 5;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    //3开始请求
    [manager POST:apiName parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //请求进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功返回数据
        success(responseObject);
        DLog(@"请求成功");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        iserror(error);
        DLog(@"网络请求失败");
    }];

}




+(void)hs_postAPIName:(NSString *)apiName parameters:(NSMutableDictionary *)parameters succes:(void(^)(id responseObject))success error:(void(^)(id error))iserror{
    DLog(@"\n【请求接口】\n%@\n【请求参数】\n%@",apiName,parameters);
    //1创建AFHTTPSessionManager 请求管理集
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //2设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 5;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    //3设置提示
    [SVProgressHUD show];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];//顶栏状态转圈图形
    //4开始请求
    [manager POST:apiName parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        //请求进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];//顶栏状态转圈图形
        [SVProgressHUD dismiss];
        //请求成功返回数据
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];//顶栏状态转圈图形
        //请求失败
        iserror(error);
        [SVProgressHUD showErrorWithStatus:@"网络连接失败"];
    }];
}

+(void)hs_postBoolClear:(BOOL)hideHUD withAPIName:(NSString *)apiName parameters:(NSMutableDictionary *)parameters succes:(void(^)(id responseObject))success error:(void(^)(id error))iserror{
    if (hideHUD) {
        [self hs_postClearAPIName:apiName parameters:parameters succes:^(id responseObject) {
            success(responseObject);
        } error:^(id error) {
            iserror(error);
        }];
    }else{
        [self hs_postAPIName:apiName parameters:parameters succes:^(id responseObject) {
            success(responseObject);
        } error:^(id error) {
            iserror(error);
        }];
    }
}

@end
