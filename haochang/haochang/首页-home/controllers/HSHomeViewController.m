//
//  HSHomeViewController.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/1.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSHomeViewController.h"
@interface HSHomeViewController ()
@end

@implementation HSHomeViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor grayColor];
    [self lodaHomeData];
}
-(void)lodaHomeData{
    [HSHttpRequest hs_getAPIName:API_Home parameters:nil succes:^(id dic) {
        DLog(@"%@",dic);
    } error:^(id error) {
        
    }];
}

@end
