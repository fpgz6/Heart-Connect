//
//  DetailCommentTableViewCell.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/20.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "DetailCommentTableViewCell.h"
#import "DetailCommet.h"
#import "DetailCommetFrame.h"
#define  titleFont [UiFont systemFontOfSzie:15]
#define  textFont [UiFont systemFontOfSzie:13]

@interface DetailCommentTableViewCell ()
@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UILabel *nameLab;
@property (nonatomic,weak) UILabel *gradeLab;
@property (nonatomic,weak) UILabel *timeLab;
@property (nonatomic,weak) UILabel *CommetLab;
@property (nonatomic,weak) UILabel *answerLab;
@property (nonatomic,weak) UIImageView *fankuiView;
@end
@implementation DetailCommentTableViewCell
//类方法，重用cell
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"commmet";
    DetailCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[DetailCommentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
//构造方法，添加需要显示的子控件
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.创建头像
        UIImageView *iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *nameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:nameLabel];
        self.nameLab = nameLabel;
        
        UILabel *gradeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:gradeLabel];
        self.gradeLab = gradeLabel;
        
        UILabel *timeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:timeLabel];
        self.timeLab = timeLabel;
        
        UILabel *commentLabel = [[UILabel alloc]init];
        [self.contentView addSubview:commentLabel];
        commentLabel.numberOfLines = 0;
        self.CommetLab = commentLabel;
        
        UILabel *answerLabel = [[UILabel alloc]init];
        [self.contentView addSubview:answerLabel];
        answerLabel.numberOfLines = 0;
        self.answerLab = answerLabel;
        
        UIImageView *fankuiView = [[UIImageView alloc]init];
        [self.contentView addSubview:fankuiView];
        self.fankuiView = fankuiView;
    }
    return self;
}

-(void)setCommetFrame:(DetailCommetFrame *)CommetFrame
{
    _CommetFrame = CommetFrame;
    [self settimgData];
    [self settingFrame];
}

-(void)settimgData
{
    DetailCommet *commeted = self.CommetFrame.Comment;
    
    //设置属性
    self.iconView.image = [UIImage imageNamed:commeted.headimage];
    self.nameLab.text = commeted.name;
    self.gradeLab.text = commeted.grade;
    self.timeLab.text = commeted.time;
    self.CommetLab.text = commeted.comme;
    self.answerLab.text = commeted.answer;
    self.fankuiView.image = [UIImage imageNamed:@"fankui.jpeg"];
}

-(void)settingFrame
{
    self.iconView.frame = self.CommetFrame.iconF;
    self.nameLab.frame = self.CommetFrame.nameF;
    self.gradeLab.frame = self.CommetFrame.gradeF;
    self.timeLab.frame = self.CommetFrame.timeF;
    self.CommetLab.frame = self.CommetFrame.commetF;
    self.answerLab.frame = self.CommetFrame.answerF;
    self.fankuiView.frame = self.CommetFrame.imgF;
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
