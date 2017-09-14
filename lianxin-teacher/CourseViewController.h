//
//  CourseViewController.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/9.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CourseTableViewCell.h"
@interface CourseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,strong) UISegmentedControl *segment;
@property (nonatomic,strong) UITableView *courseTabel;
@end
