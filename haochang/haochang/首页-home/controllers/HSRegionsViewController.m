//
//  HSRegionsViewController.m
//  haochang
//
//  Created by 侯帅 on 2016/11/11.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSRegionsViewController.h"
#import "HSRegionsCell.h"
#import "HSHomeRegionsModel.h"
@interface HSRegionsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSMutableArray *arrayRegions;
@end

@implementation HSRegionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.navigationItem.title = @"地区排行";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"说明" style:UIBarButtonItemStylePlain target:self action:@selector(clickRightItem)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
    [self loadRegionsData];
}
-(void)clickRightItem{
    
}
#pragma mark - 加载数据
-(void)loadRegionsData{
    [HSHttpRequest hs_getAPIName:API_HomeRegions parameters:nil succes:^(id dic) {
//        [dic writeToFile:@"/Users/houshuai/Desktop/plist/haochang/API_HomeRegions.plist" atomically:YES];
        self.arrayRegions = [HSHomeRegionsModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"ranks"]];
        [self.tableView reloadData];

    } error:^(id error) {
        
    }];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayRegions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HSRegionsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RegionsCell" forIndexPath:indexPath];
    cell.homeRegionsModelmodel = self.arrayRegions[indexPath.row];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HSHomeRegionsModel *model = self.arrayRegions[indexPath.row];
    [self.delegate HSRegionsViewControllerDelegateSelectWithRankld:model.rankId withRankName:model.name];
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark - 懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //去掉原有的横线显示
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerNib:[UINib nibWithNibName:@"HSRegionsCell" bundle:nil] forCellReuseIdentifier:@"RegionsCell"];
    }
    return _tableView;
}
-(NSMutableArray *)arrayRegions{
    if (!_arrayRegions) {
        _arrayRegions = [NSMutableArray array];
    }
    return _arrayRegions;
}
@end
