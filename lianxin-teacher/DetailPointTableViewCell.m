//
//  DetailPointTableViewCell.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/20.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "DetailPointTableViewCell.h"
#import "DetailPoint.h"
#import "DetailPointFrame.h"
@interface DetailPointTableViewCell()

@property (nonatomic,weak) UILabel *titLabel;
@property (nonatomic,weak) UILabel *texLabel;

@end
@implementation DetailPointTableViewCell
+(instancetype)cellWithTableVieW:(UITableView *)tableview
{
    static NSString *identifier = @"DetailPoint";
    //缓存中取
    DetailPointTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier ];
    //创建
    if (cell == nil) {
        cell = [[DetailPointTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel *titleLabel = [[UILabel alloc]init];
        [self addSubview:titleLabel];
        self.titLabel  = titleLabel;
        UILabel *textLabel1 = [[UILabel alloc]init];
        textLabel1.numberOfLines = 0;
        [self addSubview:textLabel1];
        self.texLabel = textLabel1;
    }
    return self;
}
//-(void)setDetailPointFrame:(DetailPointFrame *)Deatilframe;
//{
//    _DePointFrame = Deatilframe;
//    [self settingData];
//    [self settingFrame];
//}
//-(void)settingData
//{
//    DetailPoint *DetalMain = self.DePointFrame.
//}
//
//-(void)settingFrame
//{
//    
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
