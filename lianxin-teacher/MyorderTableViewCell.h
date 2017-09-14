//
//  MyorderTableViewCell.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/26.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyorderTableViewCell : UITableViewCell
+(instancetype)cellWithTableVIew:(UITableView *)tableview;
@property (nonatomic,strong) UILabel *orderName;
@property (nonatomic,strong) UILabel *orderTime;
@property (nonatomic,strong) UILabel *orderTeacher;
@property (nonatomic,strong) UILabel *orderPrice;
@property (nonatomic,strong) UILabel *orderNum;
@end
