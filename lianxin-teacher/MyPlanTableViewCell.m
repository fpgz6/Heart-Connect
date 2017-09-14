//
//  MyPlanTableViewCell.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/6/5.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MyPlanTableViewCell.h"
@interface MyPlanTableViewCell ()
@end
@implementation MyPlanTableViewCell
+(instancetype)cellWithTableVIew:(UITableView *)tableview
{
    static NSString *identifier = @"PlanrCE";
    MyPlanTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MyPlanTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.courseName = [[UILabel alloc]init];
        self.courseName.frame = CGRectMake(20, 10, 100, 20);
        [self addSubview:self.courseName];
        self.courseTime = [[UILabel alloc]init];
        self.courseTime.frame = CGRectMake(200, 10, 100, 20);
        [self addSubview:self.courseTime];
        self.courseTeacher = [[UILabel alloc]init];
        self.courseTeacher.frame = CGRectMake(20, 40, 100, 20);
        [self addSubview:self.courseTeacher];
        self.courseNum = [[UILabel alloc]init];
        self.courseNum.frame = CGRectMake(240, 40, 100, 20);
        [self addSubview:self.courseNum];
        self.tileLab = [[UILabel alloc]init];
        self.tileLab.frame = CGRectMake(130, 10, 60, 20);
        [self addSubview:self.tileLab];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
