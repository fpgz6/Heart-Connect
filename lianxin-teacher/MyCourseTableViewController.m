//
//  MyCourseTableViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/30.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MyCourseTableViewController.h"
#import "MyCourseTableViewCell.h"
@interface MyCourseTableViewController ()
{
    NSMutableArray *TeacherArray;
}

@end

@implementation MyCourseTableViewController
static NSString *const MycourseTabelIdentifier = @"MycourseTableID1";
-(id)init
{
    if ([super init]!=nil) {
        self.title= @"学习计划";
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self SetTeacherArr];
    self.tableView.backgroundColor = [UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f];
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
    return TeacherArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyCourseTableViewCell *cell = [MyCourseTableViewCell cellWithTableVIew:tableView];
    cell.coursePrice.text = [NSString stringWithFormat:@"%@",[TeacherArray[indexPath.row]objectForKey:@"price"]];
    cell.courseName.text = [NSString stringWithFormat:@"%@",[TeacherArray[indexPath.row]objectForKey:@"course"]];
    cell.courseTime.text = [NSString stringWithFormat:@"%@",[TeacherArray[indexPath.row]objectForKey:@"time"]];
    cell.courseTeacher.text = [NSString stringWithFormat:@"%@",[TeacherArray[indexPath.row]objectForKey:@"name"]];
    cell.courseNum.text = [NSString stringWithFormat:@"%@",[TeacherArray[indexPath.row]objectForKey:@"attendTime"]];
//    cell.jindu.text =@"1111";
    cell.jindu.text = [NSString stringWithFormat:@"%@",[TeacherArray[indexPath.row]objectForKey:@"newtime"]];
    cell.backgroundColor = [UIColor colorWithRed:0.78f green:0.96f blue:0.84f alpha:1.00f];
    return cell;
}

//设置数据源
-(void)SetTeacherArr
{
    NSString *fullPath = [[NSBundle mainBundle]pathForResource:@"weishangke.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
    TeacherArray = [NSMutableArray array];
    TeacherArray = dictArray[0];
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
