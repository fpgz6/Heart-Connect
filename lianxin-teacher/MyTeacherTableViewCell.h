//
//  MyTeacherTableViewCell.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/30.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "meandelegate.h"
@interface MyTeacherTableViewCell : UITableViewCell
@property(nonatomic,weak)id<meandelegate> Delegate;
+(instancetype)cellWithTableVIew:(UITableView *)tableview;
@property (nonatomic,strong) UILabel *teacherName;
@property (nonatomic,strong) UILabel *courseName;
@property (nonatomic,strong) UIButton *teacherBtn;
@end
