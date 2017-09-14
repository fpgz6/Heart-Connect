//
//  MyCourseTableViewCell.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/30.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCourseTableViewCell : UITableViewCell
+(instancetype)cellWithTableVIew:(UITableView *)tableview;
@property (nonatomic,strong) UILabel *courseName;
@property (nonatomic,strong) UILabel *courseTime;
@property (nonatomic,strong) UILabel *courseTeacher;
@property (nonatomic,strong) UILabel *coursePrice;
@property (nonatomic,strong) UILabel *courseNum;
@property (nonatomic,strong) UILabel *jindu;
@end
