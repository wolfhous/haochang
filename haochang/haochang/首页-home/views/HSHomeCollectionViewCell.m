//
//  HSHomeCollectionViewCell.m
//  haochang
//
//  Created by 侯帅 on 2016/11/10.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import "HSHomeCollectionViewCell.h"

@implementation HSHomeCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 5;
}


-(void)setHomeCellModel:(HSHomeCellModel *)homeCellModel{
    _homeCellModel = homeCellModel;
    
    if (homeCellModel.rank.integerValue == 1) {
        self.imageViewHeader.contentMode = UIViewContentModeScaleAspectFill;
    }else{
        self.imageViewHeader.contentMode = UIViewContentModeScaleToFill;
    }
    
    
    [self.imageViewHeader sd_setImageWithURL:[NSURL URLWithString:homeCellModel.singer[@"avatar"][@"middle"]] placeholderImage:ImagePlaceholderBig];
    if (homeCellModel.rank == nil) {
        self.labelTitle.text = homeCellModel.title;
    }else{
        self.labelTitle.text = [NSString stringWithFormat:@"%@"@"%@"@"%@",homeCellModel.rank,@".",homeCellModel.title];
        
    }
    
    self.labelNickName.text = homeCellModel.singer[@"nickname"];
    
    self.labelCity.text = homeCellModel.singer[@"location"][@"city"];
    
    
    
}


@end
