//
//  HSSongFreshViewController.m
//  haochang
//
//  Created by 侯帅 on 2016/11/11.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSSongFreshViewController.h"
#import "HSHomeCollectionViewCell.h"
#import "HSHomeCellModel.h"
#define margin 10
@interface HSSongFreshViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

/** 主视图*/
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *arraySongFresh;
@end

@implementation HSSongFreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = HSRandomColor;
    self.navigationItem.title = @"新歌";
    [self.view addSubview:self.collectionview];
    [self lodaHomeRegionData];
}
-(void)lodaHomeRegionData{
    [HSHttpRequest hs_getAPIName:API_HomeSongFresh parameters:nil succes:^(id dic) {
                [dic writeToFile:@"/Users/houshuai/Desktop/plist/haochang/API_HomeSongFresh.plist" atomically:YES];
        self.arraySongFresh = [HSHomeCellModel mj_objectArrayWithKeyValuesArray:dic[@"data"][@"songs"]];
        [self.collectionView reloadData];
    } error:^(id error) {
        
    }];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arraySongFresh.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HSHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"homeCell" forIndexPath:indexPath];
    cell.homeCellModel = self.arraySongFresh[indexPath.row];
    return cell;
}
//每个item大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat w = (SCREEN_WIDTH - margin * 3)/2;
    CGFloat h = w * 1.1;
    return CGSizeMake(w, h);
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



#pragma mark - 懒加载
-(UICollectionView *)collectionview{
    if (!_collectionView) {
        UICollectionViewFlowLayout *collectionViewLayout = [UICollectionViewFlowLayout new];
        collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:collectionViewLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        //        _collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _collectionView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [_collectionView registerNib:[UINib nibWithNibName:@"HSHomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"homeCell"];
    }
    return _collectionView;
}
-(NSMutableArray *)arraySongFresh{
    if (!_arraySongFresh) {
        _arraySongFresh = [NSMutableArray array];
    }
    return _arraySongFresh;
}


@end
