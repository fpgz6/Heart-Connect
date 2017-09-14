//
//  MymoneyTableViewCell.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/26.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MymoneyTableViewCell.h"

@implementation MymoneyTableViewCell
+(instancetype)cellWithTableVIew:(UITableView *)tableview
{
    static NSString *identifier = @"MoneyCE";
    MymoneyTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MymoneyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.moneyLab = [[UILabel alloc]init];
        self.moneyLab.frame = CGRectMake(55, 15, 100, 40);
        self.moneyLab.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.moneyLab];
        self.moneyImg = [[UIImageView alloc]init];
        self.moneyImg.frame = CGRectMake(10, 15, 25, 40);
        [self addSubview:self.moneyImg];
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
