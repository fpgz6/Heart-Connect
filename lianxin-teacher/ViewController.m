//
//  ViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/9.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "ViewController.h"
#import "meansViewController.h"
#import "MyTeacherTableViewController.h"
#import "MyzhujiaoViewController.h"
#import "MyCommentTableViewController.h"
#import "MyAnswerTableViewController.h"
#import "MyCourseTableViewController.h"
#import "MyPlanTableViewController.h"
#import "MailViewController.h"
#import "AFNetworking.h"
#import "KHTTP.h"
#import "UIKit+AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "User.h"
#import "UIKit+AFNetworking.h"
#import "SyetemDefine.h"
#import "AppDelegate.h"
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<meandelegate>
{
    UILabel *label4;
    UITableView *mytableview ;//我的 tableview 包含5行
    UIButton *myviewbtn;//个人资料按钮
    UIButton *orderbtn;//我的订单按钮
    UIButton *moneybtn;//我的钱包按钮
    UIButton *juanbtn;//我的奖学卷按钮
    UIImageView *touxiang;//头像
    UILabel *name;//姓名
    UILabel *grade;//班级
    UIView *mainview;
    NSInteger UserID;//用户id
    NSMutableDictionary *userdic;
    User *user;
    NSMutableArray *UserArray;
}

@end

@implementation ViewController
-(id)init
{
    if ([super init]!=nil) {
        self.title= @"个人中心";
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
//    [self.view setNeedsDisplay];
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(exeute) name:@"NOTIFICATION_NAME" object:nil];
    userdic = [[NSMutableDictionary alloc]init];
    UserArray = [NSMutableArray array];
    user = [[User alloc]init];
    // 设置scroll 的位置与移动范围
    UserID = 1;//测试为1
    [self setUserData];
}

-(void)exeute
{
    
}
//控件加载
-(void)userView
{
    mainview = [[UIView alloc]initWithFrame:CGRectMake(0, 60, kScreenW, kScreenH-60)];
    [self.view addSubview:mainview];
    self.scroll.contentSize = CGSizeMake(kScreenW, kScreenH-60);
    self.scroll.scrollEnabled = YES;
    self.scroll.delegate = self;
    self.scroll.bounces = NO;
    self.scroll.pagingEnabled = YES;
    self.scroll.showsHorizontalScrollIndicator = NO;
    self.scroll.directionalLockEnabled =YES;
    self.scroll.backgroundColor = [UIColor redColor];
    self.view.backgroundColor =[UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f];
    
    //个人资料
    myviewbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 80)];
    touxiang = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 60, 60)];
    myviewbtn.backgroundColor = [UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f];
    NSString *imagePath = [NSString stringWithFormat:@"http://127.0.0.1/HeartConnect/Home/images%@",APPDELEGATE.currentUser.userheadimg];
    imagePath = [self stringByDecodingURLFormat:imagePath];
    [touxiang setImageWithURL:[NSURL URLWithString:[imagePath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]] placeholderImage:nil];
    [myviewbtn addSubview:touxiang];//头像
    name = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 100, 25)];
    name.text = [NSString stringWithFormat:@"%@",APPDELEGATE.currentUser.username];
    [myviewbtn addSubview:name];//姓名
    grade = [[UILabel alloc]initWithFrame:CGRectMake(100, 40, 100, 25)];
    NSArray *gradeArr = [NSArray arrayWithObjects:@"一年级",@"二年级",@"三年级",@"四年级",@"五年级",@"六年级",@"初一",@"初二",@"初三",@"高一",@"高二",@"高三",nil];
    grade.text = [NSString stringWithFormat:@"%@",gradeArr[APPDELEGATE.currentUser.usergrade]];
    [myviewbtn addSubview:grade];//班级
    //监听个人资料按钮点击
    [myviewbtn addTarget:self action:@selector(myviewbtnclick:) forControlEvents:UIControlEventTouchUpInside];
    //我的订单按钮
    orderbtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 80, 120, 80)];
    [orderbtn setImage:[UIImage imageNamed:@"myorder"] forState:UIControlStateNormal];
    [orderbtn addTarget:self action:@selector(myorderbtnclick:) forControlEvents:UIControlEventTouchUpInside];
    //我的钱包按钮
    moneybtn = [[UIButton alloc]initWithFrame:CGRectMake(130, 80, 120, 80)];
    [moneybtn setImage:[UIImage imageNamed:@"mymoney"] forState:UIControlStateNormal];
    [moneybtn addTarget:self action:@selector(mymoneybtnclick:) forControlEvents:UIControlEventTouchUpInside];
    //我的奖学卷按钮
    juanbtn =[[UIButton alloc]initWithFrame:CGRectMake(260, 80, 120, 80)];
    [juanbtn setImage:[UIImage imageNamed:@"myjuan"] forState:UIControlStateNormal];
    [juanbtn addTarget:self action:@selector(myjuanbtnclick:) forControlEvents:UIControlEventTouchUpInside];
    //我的列表tableview
    self.mytale = [[myTableViewController alloc]init];
    self.mytale.view.frame= CGRectMake(0, 170, kScreenW, 250);
    self.mytale.Delegate = self;
    //计划与信箱tableview
    self.plantale= [[PlanTableViewController alloc]init];
    self.plantale.view.frame = CGRectMake(0, 430, kScreenW, 100);
    self.plantale.Delegate =self;
    //将各元件添加进scrollview
    [mainview addSubview:myviewbtn];
    [mainview addSubview:orderbtn];
    [mainview addSubview:moneybtn];
    [mainview addSubview:juanbtn];
    [mainview addSubview:self.mytale.view];
    [mainview addSubview:self.plantale.view];
}

//个人资料按钮点击
-(void)myviewbtnclick:(UIButton *)btn
{
    meansViewController *meanviewcontrol = [[meansViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    meanviewcontrol.username = APPDELEGATE.currentUser.username;
    meanviewcontrol.userheadimg = APPDELEGATE.currentUser.userheadimg;
    meanviewcontrol.usergrade = APPDELEGATE.currentUser.usergrade;
    meanviewcontrol.usersex = APPDELEGATE.currentUser.usersex;
    meanviewcontrol.usercity = APPDELEGATE.currentUser.usercity;
    meanviewcontrol.userid = APPDELEGATE.currentUser.userid;
    meanviewcontrol.userphone = APPDELEGATE.currentUser.userphone;
    [self.navigationController pushViewController:meanviewcontrol animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
//我的订单按钮点击
-(void)myorderbtnclick:(UIButton *)btn
{
    self.myorder = [[myorderViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:_myorder animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
//我的钱包按钮点击
-(void)mymoneybtnclick:(UIButton *)btn
{
    self.mymoney = [[mymonetViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    self.mymoney.moneynum = [[userdic valueForKey:@"usermoney"]floatValue];
    [self.navigationController pushViewController:_mymoney animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
//我的奖学卷按钮点击
-(void)myjuanbtnclick:(UIButton *)btn
{
    self.myjuan = [[myjuanViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:_myjuan animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setTeacherControl
{
    MyTeacherTableViewController *tecView = [[MyTeacherTableViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:tecView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
-(void)setZhujiaoControl
{
    MyzhujiaoViewController *zjView = [[MyzhujiaoViewController alloc]init];self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:zjView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
-(void)setCommentControl
{
   MyCommentTableViewController *MyComView = [[MyCommentTableViewController alloc]init];self.hidesBottomBarWhenPushed = YES;
     [self.navigationController pushViewController:MyComView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
-(void)setAwsControl
{
    MyAnswerTableViewController *AwsView = [[MyAnswerTableViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:AwsView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
-(void)setCourseControl
{
    MyCourseTableViewController *MyCouView= [[MyCourseTableViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:MyCouView animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
-(void)setPlanControl
{
    MyPlanTableViewController *myplan = [[MyPlanTableViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:myplan animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}
-(void)setMainControl
{
    MailViewController *mail = [[MailViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:mail animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

-(void)setUserData
{
    AFHTTPRequestOperationManager *manager1 = [[AFHTTPRequestOperationManager alloc]init];
    manager1.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *urlPath = [NSString stringWithFormat:@"%@%ld",UserMsgHttp,UserID];
    [manager1 GET:urlPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseDic = (NSDictionary *)responseObject;
        NSString *codeStr = [responseDic valueForKey:@"code"];
        if ([codeStr isEqualToString:@"200"]) {
            NSMutableArray *array = [responseDic objectForKey:@"data"];
            [UserArray addObjectsFromArray:array];
            userdic = [responseDic objectForKey:@"data"][0];
            [self userView];
            //把控件的初始化并赋值的都操作放在 afn成功将返回在success代码块里面，就可以避免上面的现象，使一旦获取了数据就初始化并赋值。
//            但是这样一来如果断网或者其他操作不成功，那么控件就无法初始化了。
        }
        else
        {
            [MBProgressHUD showError:@"失败"];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (NSString *)stringByDecodingURLFormat:(NSString *)str
{
    NSString *result = [str stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
