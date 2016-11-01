//
//  HSNavigationController.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/1.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSNavigationController.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
@interface HSNavigationController ()

@end

@implementation HSNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //一句话添加侧滑返回功能
    self.navigationController.fd_fullscreenPopGestureRecognizer.enabled = YES;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.childViewControllers.count > 0) {
        UIBarButtonItem *backItem = [UIBarButtonItem itemWithImage:@"public_sing_back_13x24_" highImage:@"public_back_13x24_" target:self action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = backItem;
        // 隐藏底部的工具条
//        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}
- (void)back
{
    [self popViewControllerAnimated:YES];
}
@end
