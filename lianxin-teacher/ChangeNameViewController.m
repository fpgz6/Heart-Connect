//
//  ChangeNameViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/18.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "ChangeNameViewController.h"
#import "KHTTP.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "HTTPRequestManager.h"
#import "AppDelegate.h"
#import "SyetemDefine.h"
@interface ChangeNameViewController ()<UITextFieldDelegate>
{
    UITextField *NameField;
}

@end

@implementation ChangeNameViewController

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"修改昵称";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NameField = [[UITextField alloc]initWithFrame:CGRectMake(30, self.view.frame.size.height*0.15, self.view.frame.size.width-60, self.view.frame.size.height/20)];
    NameField.borderStyle=UITextBorderStyleRoundedRect;
    NameField.delegate = self;
    NameField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    NameField.placeholder=@"  请输入新昵称";//设置提示文字
    NameField.font=[UIFont fontWithName:@"   请输入新昵称" size:15];
    [self.view addSubview:NameField];
    
    //设置确认修改btn
    UIButton *textViewBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*10/100, CGRectGetMaxY(NameField.frame)+20,self.view.frame.size.width*80/100,self.view.frame.size.height/18)];
    textViewBtn.backgroundColor=[UIColor colorWithRed:1.00f green:0.84f blue:0.26f alpha:1.00f];
    [textViewBtn.layer setMasksToBounds:YES];
    [textViewBtn.layer setCornerRadius:3.0];
    [textViewBtn setTitle:@"确认修改" forState:UIControlStateNormal];
    [textViewBtn setTitleColor:[UIColor colorWithRed:0.83f green:0.44f blue:0.18f alpha:1.00f] forState:UIControlStateNormal];
    [textViewBtn addTarget:self action:@selector(onTextViewBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:textViewBtn];
    // Do any additional setup after loading the view.
}

-(void)onTextViewBtnClicked
{
    NSString *urlpath = [NSString stringWithFormat:@"%@",changename];
    NSString *str = [NSString stringWithFormat:@"%@",NameField.text];
    NSDictionary *namedic = @{@"userid":@1,@"name":str};
    [[HTTPRequestManager sharedManager]POST:urlpath withDictionary:namedic complete:^(id obj, NSData *data) {
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if ([res[@"code"] isEqualToString:@"200"]) {
            [MBProgressHUD showSuccess:@"修改成功"];
            APPDELEGATE.currentUser.username = NameField.text;
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [MBProgressHUD showError:@"修改失败"];
        }
    }];
    
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
