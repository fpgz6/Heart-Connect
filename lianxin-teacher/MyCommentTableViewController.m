//
//  MyCommentTableViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/6/7.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MyCommentTableViewController.h"
#import "MyCommentTableViewCell.h"
#import "AFNetworking.h"
#import "KHTTP.h"
#import "HTTPRequestManager.h"
#import "MBProgressHUD+MJ.h"
@interface MyCommentTableViewController ()
    {
        NSMutableArray *CommentArr;
        NSMutableArray *nameArray;
        NSMutableArray *courseArray;
    }

@end
static NSString *const CommentTabelIdentifier = @"CommentTableID1";

@implementation MyCommentTableViewController
    -(id)init
    {
        if ([super init]!=nil) {
            self.title= @"我的评论";
        }
        return self;
    }

- (void)viewDidLoad {
    [super viewDidLoad];
    CommentArr = [NSMutableArray array];
    nameArray = [NSMutableArray array];
    courseArray = [NSMutableArray array];
    [self getCommentData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getCommentData
{
    AFHTTPRequestOperationManager *manager1 = [[AFHTTPRequestOperationManager alloc]init];
    manager1.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *urlPath = [NSString stringWithFormat:@"%@%d",getComment,1];
    [manager1 GET:urlPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseDic = (NSDictionary *)responseObject;
        NSString *codeStr = [responseDic valueForKey:@"code"];
        if ([codeStr isEqualToString:@"200"]) {
            NSMutableArray *array = [responseDic objectForKey:@"data"];
            [CommentArr addObjectsFromArray:array];
            for (int i=0; i<CommentArr.count; i++)
            {
                AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
                manager.responseSerializer = [AFJSONResponseSerializer serializer];
                NSString *urlpath1 = [NSString stringWithFormat:@"%@%@",DetteachermegHttp,[CommentArr[i] valueForKey:@"t_teacher_teacherid"]];
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
            [MBProgressHUD showError:@"失败"];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return courseArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        return 70;
    }

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
    {
        MyCommentTableViewCell *cell = [MyCommentTableViewCell cellWithTableVIew:tableView];
        cell.commentTime.text = [NSString stringWithFormat:@"%@",[CommentArr[indexPath.row] objectForKey:@"commenttime"]];
        cell.commentContent.frame = CGRectMake(20, 30, 320, 20);
        cell.commentContent.text = [NSString stringWithFormat:@"%@",[CommentArr[indexPath.row] objectForKey:@"commentcontent"]];
        cell.teachername.text = [NSString stringWithFormat:@"%@",nameArray[indexPath.row]];
        cell.coursename.text = [NSString stringWithFormat:@"%@",courseArray[indexPath.row]];
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
