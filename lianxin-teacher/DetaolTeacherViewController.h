//
//  DetaolTeacherViewController.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/19.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetaolTeacherViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (nonatomic,assign) NSInteger page;
@property (nonatomic,assign) NSInteger teacherid;
@property (nonatomic, copy) NSString *teachername1; // 姓名
@property (nonatomic, copy) NSString *teacherimg1; // 头像
@property (nonatomic,copy) NSString *teachercourse1;//课程
@property (nonatomic, copy) NSString *teachergrade1; // 年级
@property (nonatomic, copy) NSString *teacherdistance1; // 距离
@property (nonatomic, copy) NSString *teacherprice1; // 价格
@property (nonatomic,copy) NSString *teacherage1;//教龄
@property (nonatomic,copy) NSString *teachertime1;//教学时间
//第一板块
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *gradeLabel;
@property (nonatomic,strong) UILabel *realnameLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *teachTime;
@property (nonatomic,strong) UILabel *attendTime;
@property (nonatomic,strong) UIImageView *img1;
@property (nonatomic,strong) UIImageView *img2;
@property (nonatomic,strong) UILabel *courseLabel;
//第二板块
@property (nonatomic,strong) UILabel *studentLabel;
@property (nonatomic,strong) UIImageView *commentImg;
@property (nonatomic,strong) UILabel *serviceLabel;
@property (nonatomic,strong) UILabel *effectLabel;
@property (nonatomic,strong) UIButton *branchNumBtn;
@property (nonatomic,strong) UIButton *touchCommentBtn;
@end
