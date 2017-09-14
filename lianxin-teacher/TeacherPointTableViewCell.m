//
//  TeacherPointTableViewCell.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/20.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "TeacherPointTableViewCell.h"

@implementation TeacherPointTableViewCell

+(instancetype)cellWithTableVieW:(UITableView *)tableview
{
    static NSString *identifier = @"DetailPointV";
    //缓存中取
    TeacherPointTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier ];
    //创建
    if (cell == nil) {
        cell = [[TeacherPointTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
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
