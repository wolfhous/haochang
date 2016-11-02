//
//  HSDiscoverViewController.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/1.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSDiscoverViewController.h"

@interface HSDiscoverViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *arrayDiscover;
@end

@implementation HSDiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HSRandomColor;
    self.tableView.hidden = NO;
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dicoverCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"dicoverCell"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.detailTextLabel.font = [UIFont systemFontOfSize:13.0f];
    }
    NSDictionary *dic;
    switch (indexPath.section) {
        case 0:
        {
            dic = self.arrayDiscover[indexPath.row];
        }
            break;
        case 1:
        {
            dic = self.arrayDiscover[indexPath.row + 3];
        }
            break;
        case 2:
        {
            dic = self.arrayDiscover[indexPath.row + 6];
        }
            break;
        default:
            break;
    }
    cell.textLabel.text = dic[@"title"];
    cell.detailTextLabel.text = dic[@"subTitle"];
    cell.imageView.image = [UIImage imageNamed:dic[@"imageName"]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return @"推荐";
    }else{
        return nil;
    }
    
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
-(NSArray *)arrayDiscover{
    if (!_arrayDiscover) {
        _arrayDiscover = @[
                           @{@"imageName":@"find_friends_logo_24x24_",@"title":@"朋友圈",@"subTitle":@""},
                           @{@"imageName":@"find_close_logo_24x24_",@"title":@"附近的人",@"subTitle":@""},
                           @{@"imageName":@"find_friend_logo_24x24_",@"title":@"找朋友",@"subTitle":@""},
                           @{@"imageName":@"find_match_logo_24x24_",@"title":@"比赛",@"subTitle":@"来这选门派"},
                           @{@"imageName":@"find_event_logo_24x24_",@"title":@"活动",@"subTitle":@"倾听重庆"},
                           @{@"imageName":@"find_ktv_logo_24x24_",@"title":@"KTV",@"subTitle":@""},
                           @{@"imageName":@"find_friends_logo_24x24_",@"title":@"招聘 | 来好唱，把音乐搞大！"},
                           @{@"imageName":@"find_friends_logo_24x24_",@"title":@"教学 | 每天一首歌"}
                           ];
    }
    return _arrayDiscover;
}
@end
