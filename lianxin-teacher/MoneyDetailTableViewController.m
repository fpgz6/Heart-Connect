//
//  MoneyDetailTableViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/26.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MoneyDetailTableViewController.h"
#import "KHTTP.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "HTTPRequestManager.h"
@interface MoneyDetailTableViewController ()
    {
        NSMutableArray *moneyarr;
    }
@end

@implementation MoneyDetailTableViewController

static NSString *const MoneyDetailTabelIdentifier = @"MoneyDetailTableID1";

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"钱包明细";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    moneyarr = [NSMutableArray array];
    [self setMoneyData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return moneyarr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MoneyDetailTableViewCell *cell = [MoneyDetailTableViewCell cellWithTableVIew:tableView];
    cell.orderPrice.text = [NSString stringWithFormat:@"%@",[moneyarr[indexPath.row] valueForKey:@"moneynum"]];
    NSArray *arr = [NSArray arrayWithObjects:@"充值",@"提现", nil];
    NSInteger i = [[moneyarr[indexPath.row] valueForKey:@"moneyed"] integerValue];
    cell.orderName.text = [NSString stringWithFormat:@"%@",arr[i]];
    cell.orderTime.text = [NSString stringWithFormat:@"%@",[moneyarr[indexPath.row] valueForKey:@"moneydate"]];
    return cell;
}
-(void)setMoneyData
{
    NSString *urlpath = [NSString stringWithFormat:@"%@%d",GetMoney,1];
    [[HTTPRequestManager sharedManager]GET:urlpath complete:^(id obj, NSData *data) {
        NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        if ([res[@"code"]isEqualToString:@"200"]) {
            [moneyarr addObjectsFromArray:res[@"data"]];
            NSLog(@"数据源为：%@",moneyarr);
            [self.tableView reloadData];
        }
    }];
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
