//
//  MyCourseTableViewCell.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/30.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MyCourseTableViewCell.h"

@implementation MyCourseTableViewCell
+(instancetype)cellWithTableVIew:(UITableView *)tableview
{
    static NSString *identifier = @"MyCourCE";
    MyCourseTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MyCourseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.courseName = [[UILabel alloc]init];
        self.courseName.frame = CGRectMake(20, 10, 60, 20);
        [self addSubview:self.courseName];
        self.courseTime = [[UILabel alloc]init];
        self.courseTime.frame = CGRectMake(90, 10, 150, 20);
        [self addSubview:self.courseTime];
        self.courseTeacher = [[UILabel alloc]init];
        self.courseTeacher.frame = CGRectMake(20, 40, 60, 20);
        [self addSubview:self.courseTeacher];
        self.coursePrice = [[UILabel alloc]init];
        self.coursePrice.frame = CGRectMake(90, 40, 150, 20);
        [self addSubview:self.coursePrice];
        self.courseNum = [[UILabel alloc]init];
        self.courseNum.frame = CGRectMake(250, 40, 100, 20);
        [self addSubview:self.courseNum];
        self.jindu = [[UILabel alloc]init];
        self.jindu.frame = CGRectMake(250, 10, 100, 20);
        [self addSubview:self.jindu];
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
