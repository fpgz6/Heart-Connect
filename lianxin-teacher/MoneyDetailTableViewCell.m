//
//  MoneyDetailTableViewCell.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/26.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MoneyDetailTableViewCell.h"

@implementation MoneyDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+(instancetype)cellWithTableVIew:(UITableView *)tableview
{
    static NSString *identifier = @"MoneyDetailrCE";
    MoneyDetailTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MoneyDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
        self.orderPrice = [[UILabel alloc]init];
        self.orderPrice.frame = CGRectMake(130, 40, 100, 20);
        [self addSubview:self.orderPrice];

    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
