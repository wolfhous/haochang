//
//  HSRegionsViewController.h
//  haochang
//
//  Created by 侯帅 on 2016/11/11.
//  Copyright © 2016年 com.houshuai. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HSRegionsViewController;
@protocol HSRegionsViewControllerDelegate <NSObject>

-(void)HSRegionsViewControllerDelegateSelectWithRankld:(NSString *)rankId withRankName:(NSString *)rankName;

@end


@interface HSRegionsViewController : UIViewController
@property (nonatomic,weak)id<HSRegionsViewControllerDelegate> delegate;
@end
