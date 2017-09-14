//
//  ChoiceTableViewCell.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/6/2.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoiceTableViewCell : UITableViewCell
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak)  UILabel *nameLabel;
@property (nonatomic,weak) UILabel *gradeLabel;
@property (nonatomic,weak) UILabel *courseLabel;
@property (nonatomic,weak) UILabel *distanceLabel;
@property (nonatomic,weak) UILabel *realnameLabel;
@property (nonatomic,weak) UILabel *priceLabel;

+(instancetype)cellWithTableView:(UITableView *)tableview;
@end
