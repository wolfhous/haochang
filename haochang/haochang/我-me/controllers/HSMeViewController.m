//
//  HSMeViewController.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/1.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSMeViewController.h"
#import "HSMeCellModel.h"
#import "HSMeTopCell.h"
@interface HSMeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *arrayMe;

@end

@implementation HSMeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HSRandomColor;
    [self.tableView registerNib:[UINib nibWithNibName:@"HSMeTopCell" bundle:nil] forCellReuseIdentifier:@"meTopCell"];
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrayMe.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.arrayMe[section][@"dataCell"];
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        HSMeTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"meTopCell" forIndexPath:indexPath];
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dicoverCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"dicoverCell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.detailTextLabel.font = [UIFont systemFontOfSize:14.0f];
        }
        HSMeCellModel *modelCell = self.arrayMe[indexPath.section][@"dataCell"][indexPath.row];
        cell.textLabel.text = modelCell.title;
        cell.detailTextLabel.text = modelCell.subTitle;
        cell.imageView.image = [UIImage imageNamed:modelCell.imageName];
        return cell;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 65;
    }else{
        return 50;
    }
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.arrayMe[section][@"sectionTitle"];
    
}

#pragma mark - 懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
        _tableView.scrollIndicatorInsets = _tableView.contentInset;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
-(NSMutableArray *)arrayMe{
    if (!_arrayMe) {
        _arrayMe = [NSMutableArray array];
        //me_flower_l_36x36_@2x 鲜花颜色 me_flower_gray_18x18_@2x 鲜花无色
        //me_ad_logo_24x24_@3x 看视频
        NSArray *array = @[
                           @{@"sectionTitle":@"",
                             @"dataCell":@[
                                     [[HSMeCellModel alloc]initTitle:@"aa" subTitle:@"bb" imageName:@"vv"],
                                     ]
                             },
                           @{@"sectionTitle":@"",
                             @"dataCell":@[
                                     [[HSMeCellModel alloc]initTitle:@"私密作品" subTitle:@"bb" imageName:@"me_mysong_logo_24x24_"],
                                     [[HSMeCellModel alloc]initTitle:@"我的歌单" subTitle:@"bb" imageName:@"me_personale_mysonglist_logo_24x24_"],
                                     [[HSMeCellModel alloc]initTitle:@"收藏歌单" subTitle:@"bb" imageName:@"me_personale_collection_logo_24x24_"],
                                     ]
                             },
                           @{@"sectionTitle":@"社交",
                             @"dataCell":@[
                                     [[HSMeCellModel alloc]initTitle:@"关注" subTitle:@"bb" imageName:@"me_follow_logo_24x24_"],
                                     [[HSMeCellModel alloc]initTitle:@"粉丝" subTitle:@"bb" imageName:@"me_fans_logo_24x24_"],
                                     [[HSMeCellModel alloc]initTitle:@"打招呼" subTitle:@"bb" imageName:@"me_sayhello_logo_24x24_"],
                                     [[HSMeCellModel alloc]initTitle:@"收到鲜花" subTitle:@"bb" imageName:@"me_flower_get_logo_24x24_"],
                                     ]
                             },
                           @{@"sectionTitle":@"设置",
                             @"dataCell":@[
                                     [[HSMeCellModel alloc]initTitle:@"黑名单" subTitle:@"bb" imageName:@"me_blacklist_logo_24x24_"],
                                     [[HSMeCellModel alloc]initTitle:@"账号" subTitle:@"bb" imageName:@"me_account_logo_24x24_"],
                                     [[HSMeCellModel alloc]initTitle:@"更多" subTitle:@"" imageName:@"me_more_logo_24x24_"],
                                     ]
                             },
                           ];

        _arrayMe = [NSMutableArray arrayWithArray:array];
        //如果用户登录
        if ([HSUserSingleton sharedHSUserSingleton].isLogin)
        {
            
        }
        //没有登录
        else
        {
            [_arrayMe insertObject:@{@"sectionTitle":@"",
                                    @"dataCell":@[
                                            [[HSMeCellModel alloc]initTitle:@"1" subTitle:@"" imageName:@"me_flower_l_36x36_"],
                                            [[HSMeCellModel alloc]initTitle:@"看视频领鲜花" subTitle:@"" imageName:@"me_ad_logo_24x24_"],
                                            ]
                                     } atIndex:2];
        }
    }
    return _arrayMe;
}



@end
