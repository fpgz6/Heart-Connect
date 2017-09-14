//
//  DetailPointTableViewCell.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/20.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailPointFrame;
@interface DetailPointTableViewCell : UITableViewCell

@property (nonatomic,strong) DetailPointFrame *DePointFrame;

+(instancetype)cellWithTableVieW:(UITableView *)tableview;
@end
