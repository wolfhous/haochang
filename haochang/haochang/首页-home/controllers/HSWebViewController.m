//
//  HSWebViewController.m
//  haochang
//
//  Created by 侯帅 on 2016/11/12.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSWebViewController.h"

@interface HSWebViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation HSWebViewController

-(instancetype)initWithUrlString:(NSString *)str{
    if (self == [super init]) {
        self.urlStr = str;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"详情";
    
    
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
    self.webView.delegate = self;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]]];
}


@end
