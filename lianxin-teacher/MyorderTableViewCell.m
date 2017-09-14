//
//  MyorderTableViewCell.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/26.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MyorderTableViewCell.h"

@implementation MyorderTableViewCell
+(instancetype)cellWithTableVIew:(UITableView *)tableview
{
    static NSString *identifier = @"OrderCE";
    MyorderTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MyorderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.orderName = [[UILabel alloc]init];
        self.orderName.frame = CGRectMake(20, 10, 100, 20);
        [self addSubview:self.orderName];
        self.orderTime = [[UILabel alloc]init];
        self.orderTime.frame = CGRectMake(200, 10, 100, 20);
        [self addSubview:self.orderTime];
        self.orderTeacher = [[UILabel alloc]init];
        self.orderTeacher.frame = CGRectMake(20, 40, 100, 20);
        [self addSubview:self.orderTeacher];
        self.orderPrice = [[UILabel alloc]init];
        self.orderPrice.frame = CGRectMake(130, 40, 100, 20);
        [self addSubview:self.orderPrice];
        self.orderNum = [[UILabel alloc]init];
        self.orderNum.frame = CGRectMake(240, 40, 100, 20);
        [self addSubview:self.orderNum];
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
