//
//  RechargeViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/26.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "RechargeViewController.h"
#import "KHTTP.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "HTTPRequestManager.h"
#import "SyetemDefine.h"
#import "AppDelegate.h"
@interface RechargeViewController ()
{
    UIImageView *backimg ;
    UITextField *NameField;
}

@end



@implementation RechargeViewController

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"充值";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    backimg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 80, 375, 120)];
    backimg.image = [UIImage imageNamed:@"chongzhiBack.jpeg"];
    [self.view addSubview:backimg];
    
    NameField = [[UITextField alloc]initWithFrame:CGRectMake(30, 210, self.view.frame.size.width-60, 40)];
    NameField.borderStyle=UITextBorderStyleRoundedRect;
    NameField.delegate = self;
    NameField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    NameField.placeholder=@"  请输入充值金额";//设置提示文字
    NameField.font=[UIFont fontWithName:@"请输入充值金额" size:15];
    NameField.secureTextEntry=YES;
    [self.view addSubview:NameField];
    
    //设置确认修改btn
    UIButton *textViewBtn=[[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width*10/100, CGRectGetMaxY(NameField.frame)+20,self.view.frame.size.width*80/100,self.view.frame.size.height/18)];
    textViewBtn.backgroundColor=[UIColor colorWithRed:1.00f green:0.84f blue:0.26f alpha:1.00f];
    [textViewBtn.layer setMasksToBounds:YES];
    [textViewBtn.layer setCornerRadius:3.0];
    [textViewBtn setTitle:@"立即充值" forState:UIControlStateNormal];
    [textViewBtn setTitleColor:[UIColor colorWithRed:0.83f green:0.44f blue:0.18f alpha:1.00f] forState:UIControlStateNormal];
    [textViewBtn addTarget:self action:@selector(onTextViewBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:textViewBtn];

    // Do any additional setup after loading the view.
}

-(void)onTextViewBtnClicked
{
    NSString *urlpath = [NSString stringWithFormat:@"%@",changemoney];
    float mo = self.addmoney+[NameField.text floatValue];
    NSDictionary *moneydic = @{@"userid":@1,@"money":@(mo)};
    NSLog(@"地址信息：%@",moneydic);
    [[HTTPRequestManager sharedManager]POST:urlpath withDictionary:moneydic complete:^(id obj, NSData *data) {
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if ([res[@"code"] isEqualToString:@"200"]) {
            [MBProgressHUD showSuccess:@"充值成功"];
            APPDELEGATE.currentUser.usermoney = mo;
        }
        else
        {
            [MBProgressHUD showError:@"充值失败"];
        }
    }];
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
