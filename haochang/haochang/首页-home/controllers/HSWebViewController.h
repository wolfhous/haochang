//
//  HSWebViewController.h
//  haochang
//
//  Created by 侯帅 on 2016/11/12.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSWebViewController : UIViewController
-(instancetype)initWithUrlString:(NSString *)str;
@property (nonatomic,strong)NSString *urlStr;
@end
