//
//  myjuanViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/17.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "myjuanViewController.h"

@interface myjuanViewController ()
{
    UIImageView *img;
}

@end

@implementation myjuanViewController

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"我的奖学卷";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    img = [[UIImageView alloc]initWithFrame:CGRectMake(117.5, 233.5, 140, 200)];
    img.image = [UIImage imageNamed:@"jiangxuejuan"];
    [self.view addSubview:img];
    self.view.backgroundColor = [UIColor colorWithRed:0.94f green:0.94f blue:0.94f alpha:1.00f];
    // Do any additional setup after loading the view.
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
