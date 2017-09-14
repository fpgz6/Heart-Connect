//
//  ViewController.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/9.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myTableViewController.h"
#import "PlanTableViewController.h"
#import "myjuanViewController.h"
#import "myorderViewController.h"
#import "mymonetViewController.h"
#import "meandelegate.h"
@interface ViewController : UIViewController<UIScrollViewDelegate>
@property (nonatomic,retain) UIScrollView *scroll;//创建一个scrollview 用来划动
@property (nonatomic,strong) myTableViewController *mytale;//我的列表 包含5个cell 我的老师，我的助教，我的评论，我的问答，我的课程
@property (nonatomic,strong) PlanTableViewController *plantale;//计划与信箱 包含2个cell 学习计划与总结，校长信箱
@property (nonatomic,strong) myjuanViewController *myjuan;
@property (nonatomic,strong) mymonetViewController *mymoney;
@property (nonatomic,strong) myorderViewController *myorder;
@end
