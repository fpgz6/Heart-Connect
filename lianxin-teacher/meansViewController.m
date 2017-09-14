//
//  meansViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/14.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "meansViewController.h"
#import "MainmeanTableViewController.h"
#import "PhpneTableViewController.h"
#import "KHTTP.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "HTTPRequestManager.h"
#import "AppDelegate.h"
#import "SyetemDefine.h"
@interface meansViewController ()<meandelegate>
{
    UIButton *Exitbtn;
     MainmeanTableViewController *Mainmean;
     PhpneTableViewController *phone;
}
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height

@end

@implementation meansViewController
-(id)init
{
    if ([super init]!=nil) {
        self.title= @"个人资料";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   Mainmean = [[MainmeanTableViewController alloc]init];
   Mainmean.view.frame = CGRectMake(0, 80, kScreenW, 250);
    Mainmean.userid = self.userid;
    Mainmean.username = self.username;
    Mainmean.usergrade =self.usergrade;
    Mainmean.usercity = self.usercity;
    Mainmean.usersex =self.usersex;
    Mainmean.userheadimg = self.userheadimg;
    Mainmean.Delegate = self;
    [self.view addSubview:Mainmean.view];
    phone = [[PhpneTableViewController alloc]init];
    phone.view.frame = CGRectMake(0, 350, kScreenW, 100);
    phone.Delegate = self;
    phone.userphone = self.userphone;
    [self.view addSubview:phone.view];
    Exitbtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 470, 275, 40)];
    Exitbtn.backgroundColor = [UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f];
    [Exitbtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [Exitbtn addTarget:self action:@selector(exitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Exitbtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setviewControl//跳转改密码界面
{
    ChangPwdViewController *changePwd = [[ChangPwdViewController alloc]init];
    [self.navigationController pushViewController:changePwd animated:YES];
}
-(void)setnameControl//跳转到改名字界面
{
    ChangeNameViewController *changeName = [[ChangeNameViewController alloc]init];
    [self.navigationController pushViewController:changeName animated:YES];
    [Mainmean.tableView reloadData];
}
-(void)setgradeControl//跳转到改年级界面
{
    ChangeGradeViewController *changeGrade= [[ChangeGradeViewController alloc]init];
    [self.navigationController pushViewController:changeGrade animated:YES];
}
-(void)setCityControl//跳转到改城市界面
{
    ChangeCityViewController *changeCity= [[ChangeCityViewController alloc]init];
    [self.navigationController pushViewController:changeCity animated:YES];
}
-(void)setSexControl//修改性别
{
    UIAlertController *changeSex = [UIAlertController alertControllerWithTitle:@"修改性别" message:@"请选择性别" preferredStyle:UIAlertControllerStyleActionSheet];
    [self presentViewController:changeSex animated:YES completion:nil];
    UIAlertAction *manAction = [UIAlertAction actionWithTitle:@"男" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        Mainmean.xingbie = @"男";
        NSString *urlpath = [NSString stringWithFormat:@"%@",changeSex];
        NSDictionary *moneydic = @{@"userid":@1,@"sex":@0};
        [[HTTPRequestManager sharedManager]POST:urlpath withDictionary:moneydic complete:^(id obj, NSData *data) {
            NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if ([res[@"code"] isEqualToString:@"200"]) {
                [MBProgressHUD showSuccess:@"修改成功"];
                APPDELEGATE.currentUser.usersex = 0;
            }
            else
            {
                [MBProgressHUD showError:@"修改失败"];
            }
        }];
        [Mainmean.tableView reloadData];
    }];
    UIAlertAction *womanAction = [UIAlertAction actionWithTitle:@"女" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *urlpath = [NSString stringWithFormat:@"%@",changeSex];
        NSDictionary *moneydic = @{@"userid":@1,@"sex":@1};
        [[HTTPRequestManager sharedManager]POST:urlpath withDictionary:moneydic complete:^(id obj, NSData *data) {
            NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if ([res[@"code"] isEqualToString:@"200"]) {
                [MBProgressHUD showSuccess:@"修改成功"];
                APPDELEGATE.currentUser.usersex = 1;
            }
            else
            {
                [MBProgressHUD showError:@"修改失败"];
            }
        }];
        [Mainmean.tableView reloadData];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [changeSex addAction:manAction];
    [changeSex addAction:womanAction];
    [changeSex addAction:cancelAction];
    
}

- (void)alertTextFieldDidChange:(NSNotification *)notification{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController) {
        UITextField *login = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        okAction.enabled = login.text.length > 2;
    }
}

-(void)exitBtnClick
{
    UIWindow *window =  [UIApplication sharedApplication].keyWindow;
    
    [UIView animateWithDuration:1.0f animations:^{
        window.alpha = 0;
        window.frame = CGRectMake(0, window.bounds.size.width, 0, 0);
    } completion:^(BOOL finished) {
        exit(0);
    }];
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
