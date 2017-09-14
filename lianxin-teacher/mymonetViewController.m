//
//  mymonetViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/17.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "mymonetViewController.h"
#import "SyetemDefine.h"
#import "AppDelegate.h"
@interface mymonetViewController ()
{
    UIView *backTopView;
    UILabel *yueLab;
    UILabel *money;
}

@end
static NSString *const MoneyTabelIdentifier = @"moneyTableID1";
@implementation mymonetViewController

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"我的钱包";
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
    //设置Table
    self.MoneyTabel = [[UITableView alloc]initWithFrame:CGRectMake(0, 200, 667, 210)];
    [self.MoneyTabel registerClass:[MymoneyTableViewCell class] forCellReuseIdentifier:MoneyTabelIdentifier];
    self.MoneyTabel.delegate = self;
    self.MoneyTabel.dataSource = self;
    [self.view addSubview:self.MoneyTabel];
    // Do any additional setup after loading the view.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MymoneyTableViewCell *cell = [MymoneyTableViewCell cellWithTableVIew:tableView];
    if (indexPath.row == 0) {
        cell.moneyLab.text = @"钱包充值";
        [cell.moneyImg setImage:[UIImage imageNamed:@"money1.jpeg"]];
    }
    else if (indexPath.row == 1)
    {
        cell.moneyLab.text = @"钱包明细";
        [cell.moneyImg setImage:[UIImage imageNamed:@"money2.jpeg"]];
    }
    else if (indexPath.row == 2)
    {
        cell.moneyLab.text = @"申请提现";
        [cell.moneyImg setImage:[UIImage imageNamed:@"money3.jpeg"]];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        RechargeViewController *recharge = [[RechargeViewController alloc]init];
        recharge.addmoney = _moneynum;
        [self.navigationController pushViewController:recharge animated:YES];
    }
    if (indexPath.row == 1) {
        MoneyDetailTableViewController *moneyDetail = [[MoneyDetailTableViewController alloc]init];
        [self.navigationController pushViewController:moneyDetail animated:YES];
    }
    if (indexPath.row == 2) {
        ReplayViewController *replay = [[ReplayViewController alloc]init];
        replay.addmoney = _moneynum;
        [self.navigationController pushViewController:replay animated:YES];
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
