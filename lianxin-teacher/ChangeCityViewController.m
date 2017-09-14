//
//  ChangeCityViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/18.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "ChangeCityViewController.h"
#import "KHTTP.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "HTTPRequestManager.h"
#import "SyetemDefine.h"
#import "AppDelegate.h"
@interface ChangeCityViewController ()
{
    NSArray *cityArray;
}

@end

@implementation ChangeCityViewController

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"修改城市";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    cityArray = [NSArray arrayWithObjects:@"连云港",@"上海",@"合肥",@"深圳",@"武汉",@"长沙",@"南京",@"苏州",@"常州",@"无锡",@"南通",@"北京", nil];
    [self SetUpGradeBtn];
    // Do any additional setup after loading the view.
}

-(void)SetUpGradeBtn
{
    //创建年级按钮
    for (int i=0; i<3; i++) {
        for (int j=0; j<4; j++) {
            UIButton  *gradeBtn = [[UIButton alloc]initWithFrame:CGRectMake(20+57.5*i+80*i, 80+50*j, 60, 30)];
            gradeBtn.backgroundColor = [UIColor grayColor];
            //            gradeBtn.titleLabel.text = gradeArr[3*j+i];
            [gradeBtn setTitle:[NSString stringWithFormat:@"%@",cityArray[3*j+i]] forState:(UIControlStateNormal)];
            NSLog(@"%@",gradeBtn.titleLabel.text);
            gradeBtn.titleLabel.textColor = [UIColor redColor];
            [self.view addSubview:gradeBtn];
            [gradeBtn addTarget:self action:@selector(gradeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            gradeBtn.tag = (3*j+i)*100;
        }
    }
}
-(void)gradeBtnClick:(UIButton *)button
{
    NSLog(@"tag=%ld",button.tag/100);
    NSString *urlpath = [NSString stringWithFormat:@"%@",changecity];
    NSDictionary *gradedic = @{@"userid":@1,@"city":@(button.tag/100)};
    [[HTTPRequestManager sharedManager]POST:urlpath withDictionary:gradedic complete:^(id obj, NSData *data) {
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if ([res[@"code"] isEqualToString:@"200"]) {
            [MBProgressHUD showSuccess:@"修改成功"];
            APPDELEGATE.currentUser.usercity = button.tag/100;
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
