//
//  HSTabBarController.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/1.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSTabBarController.h"
#import "HSTabBar.h"
#import "HSNavigationController.h"
#import "HSHomeViewController.h"
@interface HSTabBarController ()

@end

@implementation HSTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController:[[HSNavigationController alloc]initWithRootViewController:[[HSHomeViewController alloc]init]]];
    [self setValue:[[HSTabBar alloc]init] forKey:@"tabBar"];
}



@end
