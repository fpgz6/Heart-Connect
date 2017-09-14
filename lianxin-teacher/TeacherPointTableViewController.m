//
//  TeacherPointTableViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/20.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "TeacherPointTableViewController.h"

@interface TeacherPointTableViewController ()
{
    CGSize size;
    float heigth;
    NSMutableArray *titelArr;//标题数组
    NSMutableArray *textArr;//内容数组
}

@end
static NSString *const teacherPointID = @"detaolPoint";
@implementation TeacherPointTableViewController
-(id)init
{
    if ([super init]!=nil) {
        self.title= self.ViewTitle;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.ViewTitle;
    [self caculateTeacher];
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
    return textArr.count;
}
//自定义cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str2 = [[NSString alloc]init];
    str2 = [textArr[indexPath.row] stringByRemovingPercentEncoding];
    CGSize size2;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    size2 = [str2 boundingRectWithSize:CGSizeMake(355, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return size2.height+45;
}
//自定义cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeacherPointTableViewCell *cell = [TeacherPointTableViewCell cellWithTableVieW:tableView];
    if (!cell) {
        cell = [[TeacherPointTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:teacherPointID];
    }
    //标题
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
    titleLab.font = [UIFont systemFontOfSize:15];
    titleLab.numberOfLines = 1;
    titleLab.textAlignment = NSTextAlignmentLeft;
    NSString *str1 = [[NSString alloc]init];
    str1 = [titelArr[indexPath.row] stringByRemovingPercentEncoding];
    titleLab.text = str1;
    [cell.contentView addSubview:titleLab];
    //内容
    UILabel *textLab = [[UILabel alloc]init];
    textLab.font = [UIFont systemFontOfSize:13];
    textLab.numberOfLines = 0;
    NSString *str2 = [[NSString alloc]init];
    str2 = [textArr[indexPath.row] stringByRemovingPercentEncoding];
    textLab.text = str2;
    CGSize size2;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    size2 = [str2 boundingRectWithSize:CGSizeMake(355, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    textLab.frame= CGRectMake(10, 35, 355, size2.height);
    [cell.contentView addSubview:textLab];
    return cell;
}

//-(void)sizeToLabelHeight
//{
//    NSString *str = @"然而，自动确定这种对敏感数据访问是否警告用户的行为给予我们更多的挑战。在我们的方法中，我们使用了以下方式，每当有任何用户交互之间的访问敏感信息，这些信息都可以被转移到一个第三方，我们乐观的假设的目的是，这种交互是正确警告用户，如图1所示，警务信息员执行三个步骤：检测隐私泄露的iOS应用程序。首先PIOS重新构建应用程序的控制流图(CFG）（CFG是底层的数据结构，用于查找代码路径敏感的来源，通常来说，CFG是相对简单的提取，即使是可用的二进制代码。）不幸的是，iOS应用程序的情况是不一样的。这是因为几乎所有的objective-C iOS开发项目中，objective-C程序通常使用大量的对象，因此，大多数函数调用实际上是调用实例方法，更糟糕的是，这些方法调用都是通过一个间接执行调用一个调度函数，因此，我们要求细化二元分析技术解决方法调用，并且确定最终这段代码调用的调度程序。在这次分析中，我们第一次尝试了重建类层次结构和objective-c类之间的继承关系";
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:13];
//    size = [str boundingRectWithSize:CGSizeMake(355, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
//    heigth = size.height;
//}


//从plist文件中取得数据

-(void)caculateTeacher
{
    NSString *teacherPath = [[NSBundle mainBundle]pathForResource:@"teacherPoint.plist" ofType:nil];
    NSArray *dictArr = [NSArray arrayWithContentsOfFile:teacherPath];
    titelArr = [NSMutableArray array];
    textArr = [NSMutableArray array];
    NSArray *arr = [[NSArray alloc]init];
    arr=  dictArr[self.currentPage];
    for (int i=0; i<arr.count; i++) {
        [titelArr addObject:[arr[i] valueForKey:@"title"]];
        [textArr addObject:[arr[i] valueForKey:@"text"]];
    }
    NSLog(@"title=%@",titelArr);
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
     Configure the cell...
    
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
