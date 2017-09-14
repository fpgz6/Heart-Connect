//
//  ReplayViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/26.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "ReplayViewController.h"
#import "KHTTP.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "HTTPRequestManager.h"
#import "AppDelegate.h"
#import "SyetemDefine.h"
@interface ReplayViewController ()
{
    UIView *backTopView;
    UILabel *yueLab;
    UILabel *money;
    UITextField *NameField;
}

@end

@implementation ReplayViewController

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"提现";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    backTopView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 667, 200)];
    backTopView.backgroundColor=[UIColor colorWithRed:0.97f green:0.54f blue:0.02f alpha:1.00f];
    [self.view addSubview:backTopView];
    yueLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 90, 150, 20)];
    yueLab.text = @"钱包余额（元）";
    yueLab.font = [UIFont systemFontOfSize:15];
    yueLab.textColor = [UIColor whiteColor];
    [backTopView addSubview:yueLab];
    money = [[UILabel alloc]initWithFrame:CGRectMake(10, 120, 200, 40)];
    money.text = [NSString stringWithFormat:@"%0.1f",APPDELEGATE.currentUser.usermoney];
    money.font = [UIFont systemFontOfSize:33];
    
    money.textColor = [UIColor whiteColor];
    [backTopView addSubview:money];
    
    NameField = [[UITextField alloc]initWithFrame:CGRectMake(30, 210, self.view.frame.size.width-60, 40)];
    NameField.borderStyle=UITextBorderStyleRoundedRect;
    NameField.delegate = self;
    NameField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    NameField.placeholder=@"  请输入提现金额";//设置提示文字
    NameField.font=[UIFont fontWithName:@"请输入提现金额" size:15];
    [self.view addSubview:NameField];
    
    //设置确认修改btn
    UIButton *textViewBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*10/100, CGRectGetMaxY(NameField.frame)+20,self.view.frame.size.width*80/100,self.view.frame.size.height/18)];
    textViewBtn.backgroundColor=[UIColor colorWithRed:1.00f green:0.84f blue:0.26f alpha:1.00f];
    [textViewBtn.layer setMasksToBounds:YES];
    [textViewBtn.layer setCornerRadius:3.0];
    [textViewBtn setTitle:@"立即提现" forState:UIControlStateNormal];
    [textViewBtn setTitleColor:[UIColor colorWithRed:0.83f green:0.44f blue:0.18f alpha:1.00f] forState:UIControlStateNormal];
    [textViewBtn addTarget:self action:@selector(onTextViewBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:textViewBtn];
    // Do any additional setup after loading the view.
}

-(void)onTextViewBtnClicked
{
    NSString *urlpath = [NSString stringWithFormat:@"%@",changemoney];
    float mo = self.addmoney-[NameField.text floatValue];
    NSDictionary *moneydic = @{@"userid":@1,@"money":@(mo)};
    NSLog(@"地址信息：%@",moneydic);
    [[HTTPRequestManager sharedManager]POST:urlpath withDictionary:moneydic complete:^(id obj, NSData *data) {
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if ([res[@"code"] isEqualToString:@"200"]) {
            [MBProgressHUD showSuccess:@"提现成功"];
            APPDELEGATE.currentUser.usermoney = mo;
        }
        else
        {
            [MBProgressHUD showError:@"提现失败"];
        }
    }];
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController popViewControllerAnimated:YES];
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
