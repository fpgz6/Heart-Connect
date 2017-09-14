//
//  MainTableViewCell.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/17.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MainTableViewCell.h"
#define NJNameFont [UIFont systemFontOfSize:15] 
#define NJTextFont [UIFont systemFontOfSize:16]
@interface MainTableViewCell ()


@end
@implementation MainTableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableview
{
    static NSString *identifier = @"status";
    //缓存中取
    MainTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier ];
    //创建
    if (cell == nil) {
        cell = [[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
//构造方法 一般在这个方法中添加需要显示的子空间
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //让子定义cell和系统的cell一样，一创建出来就拥有一些子控件提供给我们使用
        //1.创建头像
        UIImageView *iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        self.iconView.frame =CGRectMake(10, 10, 50, 50);
        //2.创建名字
        UILabel *nameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        self.nameLabel.font = [UIFont systemFontOfSize:15];
        self.nameLabel.frame =CGRectMake(80, 10, 100, 15);
        //3.创建年级
        UILabel *gradeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:gradeLabel];
        self.gradeLabel = gradeLabel;
        self.gradeLabel.font = [UIFont systemFontOfSize:15];
        self.gradeLabel.frame = CGRectMake(130, 30, 50, 15);
        
        UILabel *courseLabel = [[UILabel alloc]init];
        [self.contentView addSubview:courseLabel];
        self.courseLabel = courseLabel;
        self.courseLabel.font = [UIFont systemFontOfSize:15];
        self.courseLabel.frame = CGRectMake(80, 30, 40, 15);
        //4.创建距离
        UILabel *distanceLabel = [[UILabel alloc]init];
        [self.contentView addSubview:distanceLabel];
        self.distanceLabel = distanceLabel;
        self.distanceLabel.font = [UIFont systemFontOfSize:15];
        self.distanceLabel.frame =CGRectMake(290, 50, 80, 15);
        //5.创建标志
        UILabel *realnameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:realnameLabel];
        self.realnameLabel = realnameLabel;
        self.realnameLabel.font = [UIFont systemFontOfSize:15];
        self.realnameLabel.frame = CGRectMake(80, 50, 100, 15);
        self.realnameLabel.text = @"已认证";
        //6.创建价格
        UILabel *priceLabel = [[UILabel alloc]init];
        [self.contentView addSubview:priceLabel];
        self.priceLabel = priceLabel;
        self.priceLabel.font = [UIFont systemFontOfSize:15];
        self.priceLabel.frame = CGRectMake(290, 10, 80, 15);
        
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
