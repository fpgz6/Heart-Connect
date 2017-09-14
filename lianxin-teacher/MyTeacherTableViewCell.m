//
//  MyTeacherTableViewCell.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/30.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MyTeacherTableViewCell.h"

@interface MyTeacherTableViewCell ()

@end
@implementation MyTeacherTableViewCell

+(instancetype)cellWithTableVIew:(UITableView *)tableview
{
    static NSString *identifier = @"teacherCE";
    MyTeacherTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MyTeacherTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.teacherName = [[UILabel alloc]init];
        self.teacherName.frame = CGRectMake(20, 10, 100, 20);
        self.courseName = [[UILabel alloc]init];
        self.courseName.frame = CGRectMake(130, 10, 100, 20);
        self.teacherBtn = [[UIButton alloc]init];
        self.teacherBtn.frame = CGRectMake(240, 10, 50, 20);
        [self addSubview:self.teacherName];
        [self addSubview:self.courseName];
        [self addSubview:self.teacherBtn];
        [self.teacherBtn addTarget:self action:@selector(setPhoneCall) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
-(void)setPhoneCall
{
    [self.Delegate setCall];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
