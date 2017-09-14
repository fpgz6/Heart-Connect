//
//  myTableViewController.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/13.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "meandelegate.h"
@interface myTableViewController : UITableViewController
@property (nonatomic,weak)id<meandelegate>Delegate;
@end
