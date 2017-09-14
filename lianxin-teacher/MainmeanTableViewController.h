//
//  MainmeanTableViewController.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/14.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "meandelegate.h"
@interface MainmeanTableViewController : UITableViewController
@property (nonatomic,weak)id<meandelegate>Delegate;
@property (nonatomic,assign) NSString *nameField;
@property (nonatomic,assign) NSString *xingbie;

@property (nonatomic,assign)NSInteger userid;
@property (nonatomic,copy) NSString *username;
@property (nonatomic,copy) NSString *userpassword;
@property (nonatomic,copy) NSString *userheadimg;
@property (nonatomic,assign)NSInteger usergrade;
@property (nonatomic,assign) NSInteger usersex;
@property (nonatomic,assign) NSInteger usercity;
@property (nonatomic,assign) NSInteger userphone;
@property (nonatomic,assign) float usermoney;
@property (nonatomic,copy) NSString *userzhujiaoname;
@property (nonatomic,assign) NSInteger userzhujiaophone;
@property (nonatomic,copy) NSString *userarea;
@property (nonatomic,copy) NSString *userplace;
@end
