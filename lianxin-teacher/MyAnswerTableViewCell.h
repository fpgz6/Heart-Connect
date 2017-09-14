//
//  MyAnswerTableViewCell.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/6/7.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAnswerTableViewCell : UITableViewCell
+(instancetype)cellWithTableVIew:(UITableView *)tableview;
    @property (nonatomic,strong) UILabel *commentName;
    @property (nonatomic,strong) UILabel *commentTime;
    @property (nonatomic,strong) UILabel *commentContent;
    @property (nonatomic,strong) UILabel *teachername;
    @property (nonatomic,strong) UILabel *coursename;
@end
