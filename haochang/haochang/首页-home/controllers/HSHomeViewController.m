//
//  HSHomeViewController.m
//  haochang
//
//  Created by 壹号商圈 on 16/11/1.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSHomeViewController.h"
#import "HSHomeCollectionViewCell.h"
#import "HSHomeHeaderView.h"
#define heraerViewHeight 200
#define margin 10
@interface HSHomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
/** 主视图*/
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)HSHomeHeaderView *headerView;
@end

@implementation HSHomeViewController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.collectionview];
    [self lodaHomeData];
}
-(void)lodaHomeData{
    [HSHttpRequest hs_getAPIName:API_Home parameters:nil succes:^(id dic) {
        DLog(@"%@",dic);
    } error:^(id error) {
        
    }];
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HSHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeCell" forIndexPath:indexPath];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableViewHeader" forIndexPath:indexPath];
        [view addSubview:self.headerView];
        return view;
    }else{
        UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ReusableViewFooter" forIndexPath:indexPath];
        return view;
    }
}
//每个item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat w = (SCREEN_WIDTH - margin * 3)/2;
    return indexPath.row == 0 ? CGSizeMake(SCREEN_WIDTH - margin *2, w * 1.2) : CGSizeMake(w, w *1.2);
}
//四周边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(margin , margin, margin + 46, margin);
}
//行间距 垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return margin;
}
//内边距 水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return margin;
}
//头部高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(0, heraerViewHeight);
}
//尾部高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeZero;
}

#pragma mark - 懒加载
-(UICollectionView *)collectionview{
    if (!_collectionView) {
        UICollectionViewFlowLayout *collectionViewLayout = [UICollectionViewFlowLayout new];
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:collectionViewLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"HSHomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"homeCell"];
        
        //注册ReusableView
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ReusableViewFooter"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ReusableViewHeader"];
    }
    return _collectionView;
}
-(HSHomeHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[HSHomeHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, heraerViewHeight)];
    }
    return _headerView;
}


















@end
