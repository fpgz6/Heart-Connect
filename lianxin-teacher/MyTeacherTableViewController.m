//
//  MyTeacherTableViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/30.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MyTeacherTableViewController.h"
#import "MyTeacherTableViewCell.h"
@interface MyTeacherTableViewController ()<meandelegate>
{
    NSMutableArray *teacherArray;
}

@end

@implementation MyTeacherTableViewController
static NSString *const MyTeacherTabelIdentifier = @"MyTeacherTableID1";

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"我的老师";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetTeacherArr];
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
    return teacherArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTeacherTableViewCell *cell = [MyTeacherTableViewCell cellWithTableVIew:tableView];
    cell.teacherName.text = [NSString stringWithFormat:@"%@",[teacherArray[indexPath.row]objectForKey:@"name"]];
    cell.courseName.text = [NSString stringWithFormat:@"%@",[teacherArray[indexPath.row]objectForKey:@"course"]];
    [cell.teacherBtn setImage:[UIImage imageNamed:@"teacherphone.jpeg"] forState:UIControlStateNormal];
    cell.Delegate = self;
    return cell;
}

//设置数据源
-(void)SetTeacherArr
{
    NSString *fullPath = [[NSBundle mainBundle]pathForResource:@"weishangke.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
    teacherArray = [NSMutableArray array];
    teacherArray = dictArray[0];
}
//拨打电话实现方法
-(void)setCall
{
    NSString *allString = [NSString stringWithFormat:@"tel:10086"];
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:allString]];
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
