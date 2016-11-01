//
//  HSHomeViewController.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/1.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSHomeViewController.h"
#import "HSHomeTitleBtn.h"
#import "HSChatTableViewController.h"
#import "HSMeViewController.h"
#import "HSDiscoverViewController.h"
@interface HSHomeViewController ()
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)HSHomeTitleBtn *selectBtn;
@property (nonatomic,strong)UIView *indicateView;
@end

@implementation HSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //设置导航栏
    [self setupNavBar];
    //添加子控制器
    [self setupChildVC];
}

-(void)setupNavBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"public_comment_32x32_" highImage:@"public_comment_32x32_" target:self action:@selector(clickHomeNavBarLeftItem)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"homepage_record_32x32_" highImage:@"homepage_record_32x32_" target:self action:@selector(clickHomeNavBarRightItem)];
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    self.navigationItem.titleView = titleView;
    
    CGFloat w = titleView.xmg_width/self.titleArray.count;
    CGFloat h = titleView.xmg_height - 1;
    for (NSInteger i = 0; i < self.titleArray.count; i++) {
        HSHomeTitleBtn *btn = [HSHomeTitleBtn buttonWithType:UIButtonTypeCustom];
        [btn setTitle:self.titleArray[i] forState:UIControlStateNormal];
        CGFloat x = i * w;
        btn.frame = CGRectMake(x, 0, w, h);
        [titleView addSubview:btn];
        [btn addTarget:self action:@selector(clickTitleBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    //首个选中按钮
    self.selectBtn = titleView.subviews.firstObject;
    self.selectBtn.selected = YES;
    [self.selectBtn.titleLabel sizeToFit];
    //模拟指示线条
    UIView *indicateView = [[UIView alloc]init];
    self.indicateView = indicateView;
    indicateView.backgroundColor = HSMainColor;
    indicateView.xmg_y = h;
    indicateView.xmg_height = 1;
    indicateView.xmg_width = self.selectBtn.titleLabel.xmg_width;
    indicateView.xmg_centerX = self.selectBtn.center.x;
    [titleView addSubview:indicateView];
    
}
//点击导航标题
-(void)clickTitleBtn:(HSHomeTitleBtn *)btn{
    DLogFunc
    self.selectBtn.selected = NO;
    self.selectBtn = btn;
    self.selectBtn.selected = YES;
    [UIView animateWithDuration:0.2 animations:^{
        self.indicateView.xmg_width = btn.titleLabel.xmg_width;
        self.indicateView.xmg_centerX = btn.center.x;
    }];
}
//添加子控制器
-(void)setupChildVC{
    
}


//点击左上角item 消息
-(void)clickHomeNavBarLeftItem{
    HSChatTableViewController *chatTableVC = [[HSChatTableViewController alloc]init];
    [self.navigationController pushViewController:chatTableVC animated:YES];
}
//点击右上角item
-(void)clickHomeNavBarRightItem{
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"aa" message:@"vv" preferredStyle:0];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"a" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [ac addAction:action];
    [self presentViewController:ac animated:YES completion:nil];
}



#pragma mark - 懒加载
-(NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSArray array];
        _titleArray = @[@"aaa",@"bfef",@"cerrff"];
    }
    return _titleArray;
}


@end
