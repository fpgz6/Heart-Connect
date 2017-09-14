//
//  myorderViewController.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/17.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyorderTableViewCell.h"
@interface myorderViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UISegmentedControl *Ordersegment;
@property (nonatomic,strong) UITableView *OrderTabel;

@end
