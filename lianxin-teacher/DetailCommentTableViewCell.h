//
//  DetailCommentTableViewCell.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/20.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailCommetFrame;
@interface DetailCommentTableViewCell : UITableViewCell

//接受外界传入的模型
@property (nonatomic,strong) DetailCommetFrame *CommetFrame;
+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
