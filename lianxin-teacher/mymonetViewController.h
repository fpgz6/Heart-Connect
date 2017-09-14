//
//  mymonetViewController.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/17.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MymoneyTableViewCell.h"
#import "RechargeViewController.h"
#import "ReplayViewController.h"
#import "MoneyDetailTableViewController.h"
@interface mymonetViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *MoneyTabel;
@property (nonatomic,assign) float  moneynum;
@end
