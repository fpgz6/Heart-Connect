//
//  MyPlanTableViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/6/5.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MyPlanTableViewController.h"
#import "AFNetworking.h"
#import "KHTTP.h"
@interface MyPlanTableViewController ()
{
    NSMutableArray *OrderArray;
    NSMutableArray *nameArray;
    NSMutableArray *courseArray;
}
@end

@implementation MyPlanTableViewController
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
static NSString *const planTabelIdentifier = @"planTableID1";
-(id)init
{
    if ([super init]!=nil) {
        self.title= @"我的学习计划";
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    AFHTTPRequestOperationManager *manager1 = [[AFHTTPRequestOperationManager alloc]init];
    manager1.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *urlPath = [NSString stringWithFormat:@"%@",ALLorder];
    [manager1 GET:urlPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseDic = (NSDictionary *)responseObject;
        NSString *codeStr = [responseDic valueForKey:@"code"];
        if ([codeStr isEqualToString:@"200"]) {
            NSMutableArray *array = [responseDic objectForKey:@"data"];
            [OrderArray addObjectsFromArray:array];
            for (int i=0; i<OrderArray.count; i++)
            {
                AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
                manager.responseSerializer = [AFJSONResponseSerializer serializer];
                NSString *urlpath1 = [NSString stringWithFormat:@"%@%@",DetteachermegHttp,[OrderArray[i] valueForKey:@"t_teacher_teacherid"]];
                [manager GET:urlpath1 parameters:nil success:^(AFHTTPRequestOperation *operation1, id responseObject1)
                 {
                     NSDictionary *responseDict = (NSDictionary *)responseObject1;
                     NSString *CodeStr1 = [responseDict valueForKey:@"code"];
                     if ([CodeStr1 isEqualToString:@"200"])
                     {
                         //名字
                         NSString *name =[NSString stringWithFormat:@"%@",[[responseDict objectForKey:@"data"][0] valueForKey:@"teachername"]];
                         [nameArray addObject:name];
                         //课程
                         NSInteger courseint = [[[responseDict objectForKey:@"data"][0] valueForKey:@"teachercourse"] integerValue];
                         NSArray *courseA = [NSArray arrayWithObjects:@"全部",@"语文",@"数学",@"英语",@"物理",@"化学",@"生物",@"政治",@"地理",@"历史", nil];
                         NSString *course =[NSString stringWithFormat:@"%@",courseA[courseint]];
                         [courseArray addObject:course];
                         [self.tableView reloadData];
                     }
                     else
                     {
                     }
                     
                     
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error)
                 {
                     
                 }];
            }
        }
        else
        {
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    OrderArray = [NSMutableArray array];
    nameArray = [NSMutableArray array];
    courseArray = [NSMutableArray array];
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
    return nameArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyPlanTableViewCell *cell = [MyPlanTableViewCell cellWithTableVIew:tableView];
    cell.courseName.text = [NSString stringWithFormat:@"%@",courseArray[indexPath.row]];
    cell.courseTeacher.text = [NSString stringWithFormat:@"%@",nameArray[indexPath.row]];
    
    cell.courseTime.text = [NSString stringWithFormat:@"%@",[OrderArray[indexPath.row] valueForKey:@"orderdate"]];
    cell.courseNum.text =@"10课时";
    NSInteger ordered = [[OrderArray[indexPath.row] valueForKey:@"myordered"] integerValue];
    NSArray *arr = [NSArray arrayWithObjects:@"未开始",@"进行中",@"进行中",@"已结束", nil];
    cell.tileLab.text = [NSString stringWithFormat:@"%@",arr[ordered]];
    cell.backgroundColor = [UIColor colorWithRed:0.78f green:0.96f blue:0.84f alpha:1.00f];
    return cell;
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
