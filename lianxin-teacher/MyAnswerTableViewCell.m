//
//  MyAnswerTableViewCell.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/6/7.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MyAnswerTableViewCell.h"

@implementation MyAnswerTableViewCell
+(instancetype)cellWithTableVIew:(UITableView *)tableview
    {
        static NSString *identifier = @"MyAnswerCE";
        MyAnswerTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[MyAnswerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        return cell;
    }
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
    {
        if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
            self.commentTime = [[UILabel alloc]init];
            self.commentTime.frame = CGRectMake(20, 10, 100, 20);
            [self addSubview:self.commentTime];
            self.commentContent = [[UILabel alloc]init];
            [self addSubview:self.commentContent];
            self.teachername = [[UILabel alloc]init];
            self.teachername.frame = CGRectMake(230, 10, 80, 20);
            [self addSubview:self.teachername];
            self.coursename = [[UILabel alloc]init];
            self.coursename.frame = CGRectMake(150, 10, 50, 20);
            [self addSubview:self.coursename];
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
