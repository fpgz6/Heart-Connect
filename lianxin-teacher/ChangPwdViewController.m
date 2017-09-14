//
//  ChangPwdViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/14.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "ChangPwdViewController.h"
#import "KHTTP.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "HTTPRequestManager.h"
#import "AppDelegate.h"
#import "SyetemDefine.h"
@interface ChangPwdViewController ()<UITextFieldDelegate>
{
    UITextField *PwdField;
    UITextField *PwdField2;
}

@end

@implementation ChangPwdViewController

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"修改密码";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    PwdField = [[UITextField alloc]initWithFrame:CGRectMake(30, self.view.frame.size.height*0.15, self.view.frame.size.width-60, self.view.frame.size.height/20)];
    PwdField.borderStyle=UITextBorderStyleRoundedRect;
    PwdField.delegate = self;
    PwdField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    PwdField.placeholder=@"  请输入新密码";//设置提示文字
    PwdField.font=[UIFont fontWithName:@"   请输入新密码" size:15];
    [self.view addSubview:PwdField];
    
    //设置再次输入密码textfield
    PwdField2=[[UITextField alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(PwdField.frame)+20,self.view.frame.size.width-60,self.view.frame.size.height/20)];
    PwdField2.borderStyle=UITextBorderStyleRoundedRect;
    PwdField2.backgroundColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:1];//设置背景
    //    textField2.borderStyle=UITextBorderStyleRoundedRect;//设置边框
    PwdField2.delegate=self;
    PwdField2.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    PwdField2.placeholder=@"  请再次输入新密码";
    PwdField2.font=[UIFont fontWithName:@"请再次输入新密码" size:15];
    [self.view addSubview:PwdField2];
    
    //设置确认修改btn
    UIButton *textViewBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*10/100, CGRectGetMaxY(PwdField2.frame)+20,self.view.frame.size.width*80/100,self.view.frame.size.height/18)];
    textViewBtn.backgroundColor=[UIColor colorWithRed:1.00f green:0.84f blue:0.26f alpha:1.00f];
    [textViewBtn.layer setMasksToBounds:YES];
    [textViewBtn.layer setCornerRadius:3.0];
    [textViewBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    [textViewBtn setTitleColor:[UIColor colorWithRed:0.83f green:0.44f blue:0.18f alpha:1.00f] forState:UIControlStateNormal];
    [textViewBtn addTarget:self action:@selector(onTextViewBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:textViewBtn];
    
    PwdField.secureTextEntry=YES;
    PwdField2.secureTextEntry=YES;
}

-(void)onTextViewBtnClicked
{
    if ([PwdField.text isEqualToString:PwdField2.text]) {
        NSString *urlpath = [NSString stringWithFormat:@"%@",changepassword];
        NSString *str = [NSString stringWithFormat:@"%@",PwdField.text];
        NSDictionary *namedic = @{@"userid":@1,@"password":str};
        [[HTTPRequestManager sharedManager]POST:urlpath withDictionary:namedic complete:^(id obj, NSData *data) {
            NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if ([res[@"code"] isEqualToString:@"200"]) {
                [MBProgressHUD showSuccess:@"修改成功"];
                APPDELEGATE.currentUser.userpassword = PwdField.text;
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [MBProgressHUD showError:@"修改失败"];
            }
        }];

    }
    else
    {
        [MBProgressHUD showError:@"请输入相同的密码"];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
