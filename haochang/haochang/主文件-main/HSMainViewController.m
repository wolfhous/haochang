//
//  HSMainViewController.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/1.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSMainViewController.h"
#import "HSHomeTitleBtn.h"//头部标题按钮
#import "HSChatTableViewController.h"//消息
#import "HSHomeViewController.h"//首页
#import "HSMeViewController.h"//我
#import "HSDiscoverViewController.h"//发现
@interface HSMainViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,strong)HSHomeTitleBtn *selectBtn;
@property (nonatomic,strong)UIView *indicateView;
@property (nonatomic,strong)UIView *titleView;
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation HSMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //设置导航栏
    [self setupNavBar];
    //设置子控制器
    [self setupChildVC];
    //添加子控制器
    [self addChildVcView];
}
//=============导航栏相关 begin============
-(void)setupNavBar{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"public_comment_32x32_" highImage:@"public_comment_32x32_" target:self action:@selector(clickHomeNavBarLeftItem)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"homepage_record_32x32_" highImage:@"homepage_record_32x32_" target:self action:@selector(clickHomeNavBarRightItem)];
    
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    self.titleView = titleView;
    self.navigationItem.titleView = titleView;
    
    CGFloat w = titleView.xmg_width/self.titleArray.count;
    CGFloat h = titleView.xmg_height - 1;
    for (NSInteger i = 0; i < self.titleArray.count; i++) {
        HSHomeTitleBtn *btn = [HSHomeTitleBtn buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
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
    //指示器动画
    [UIView animateWithDuration:0.2 animations:^{
        self.indicateView.xmg_width = btn.titleLabel.xmg_width;
        self.indicateView.xmg_centerX = btn.center.x;
    }];
    // 让UIScrollView滚动到对应位置
    CGPoint point = self.scrollView.contentOffset;
    point.x = btn.tag * self.scrollView.xmg_width;
    [self.scrollView setContentOffset:point animated:YES];
    
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
//=============导航栏相关 end============


//=============子控制器 begin============
//添加子控制器
-(void)setupChildVC{
    // 不允许自动调整scrollView的内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    //设置滚动视图
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH * self.titleArray.count, SCREEN_HEIGHT);
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    //添加子控制器
    HSHomeViewController *homeVC = [[HSHomeViewController alloc]init];
    [self addChildViewController:homeVC];
    HSDiscoverViewController *discoverVC = [[HSDiscoverViewController alloc]init];
    [self addChildViewController:discoverVC];
    HSMeViewController *meVC = [[HSMeViewController alloc]init];
    [self addChildViewController:meVC];
    
    
}
#pragma mark - <UIScrollViewDelegate>
/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 使用setContentOffset:animated:或者scrollRectVisible:animated:方法让scrollView产生滚动动画
 */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self addChildVcView];
}

/**
 * 在scrollView滚动动画结束时, 就会调用这个方法
 * 前提: 人为拖拽scrollView产生的滚动动画
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    // 选中\点击对应的按钮
    NSUInteger index = scrollView.contentOffset.x / scrollView.xmg_width;
    HSHomeTitleBtn *titleButton = self.titleView.subviews[index];
    [self clickTitleBtn:titleButton];
    
    // 添加子控制器的view
    [self addChildVcView];
    
}
#pragma mark - 添加子控制器的view
- (void)addChildVcView{
    NSUInteger index = self.scrollView.contentOffset.x/self.scrollView.xmg_width;
    UIViewController *childVC = self.childViewControllers[index];
    if ([childVC isViewLoaded]) return;
    childVC.view.frame = self.scrollView.bounds;
    [self.scrollView addSubview:childVC.view];
}

//=============子控制器 end============


#pragma mark - 懒加载
-(NSArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [NSArray array];
        _titleArray = @[@"首页",@"发现",@"我的"];
    }
    return _titleArray;
}

@end
