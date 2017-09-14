//
//  MymoneyTableViewCell.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/26.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MymoneyTableViewCell : UITableViewCell
+(instancetype)cellWithTableVIew:(UITableView *)tableview;
@property (nonatomic,strong) UILabel *moneyLab;
@property (nonatomic,strong) UIImageView *moneyImg;

@end
