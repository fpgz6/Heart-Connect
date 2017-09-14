//
//  MainmeanTableViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/14.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MainmeanTableViewController.h"
#import "takePhoto.h"
#import "SyetemDefine.h"
#import "AppDelegate.h"
@interface MainmeanTableViewController ()<meandelegate>
{
    UIImage *myimage;
//    UIImageView *imgView;
}

@end

@implementation MainmeanTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.scrollEnabled = NO;
//    myimage = [UIImage imageNamed:@"timg.jpeg"];
//    _xingbie = [NSString stringWithFormat:@"男"];
//    self.nameField = [NSString stringWithFormat:@"回忆747"];
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
    return 5;
}

//自定义cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    UIImageView *pic;
    UILabel *lab;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        pic = [[UIImageView alloc]initWithFrame:CGRectMake(320, 8, 34, 34)];
        lab = [[UILabel alloc]initWithFrame:CGRectMake(253, 8, 102, 34)];
        lab.textAlignment = NSTextAlignmentRight;
        //名字
        if (indexPath.row == 1) {
            lab.text = [NSString stringWithFormat:@"%@",APPDELEGATE.currentUser.username];
        }
        //年级
        if (indexPath.row == 2) {
            NSArray *gradeArr = [NSArray arrayWithObjects:@"一年级",@"二年级",@"三年级",@"四年级",@"五年级",@"六年级",@"初一",@"初二",@"初三",@"高一",@"高二",@"高三",nil];
            NSInteger grade=APPDELEGATE.currentUser.usergrade;
            
            lab.text = [NSString stringWithFormat:@"%@",gradeArr[grade]];
        }
        //性别
        if (indexPath.row == 3) {
            NSArray *sexArr = [NSArray arrayWithObjects:@"男",@"女", nil];
            NSInteger sex = APPDELEGATE.currentUser.usersex;
            lab.text = [NSString stringWithFormat:@"%@",sexArr[sex]];
        }
        //城市
        if (indexPath.row == 4) {
           NSArray *cityArray = [NSArray arrayWithObjects:@"连云港",@"上海",@"合肥",@"深圳",@"武汉",@"长沙",@"南京",@"苏州",@"常州",@"无锡",@"南通", nil];
            NSInteger city = APPDELEGATE.currentUser.usercity;
            lab.text = [NSString stringWithFormat:@"%@",cityArray[city]];
        }
        //头像
        myimage = [UIImage imageNamed:@"timg1.jpeg"];
        pic.image = myimage;
        if (indexPath.row == 0) {
            [cell.contentView addSubview:pic];
        }
        else
        {
            [cell.contentView addSubview:lab];
        }
        
    }

    NSArray *arr = [NSArray arrayWithObjects:@"头像 ",@"昵称",@"年级",@"性别",@"城市", nil];
    cell.textLabel.text = arr[indexPath.row];
    return cell;
}
//返回cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *mycell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    if (mycell == nil) {
        return 0;
    }
    else
    {
        NSLog(@"%f",mycell.frame.size.height);
        return 50;
    }
    return 0;
}
//被选中时调用方法
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        NSLog(@"打开相机/相册");
        [takePhoto sharePicture:^(UIImage *headimage) {
            myimage = headimage;
            [self.tableView reloadData];
        }];
    }
    else if (indexPath.row == 1)
    {
        NSLog(@"修改昵称");
        [self.Delegate setnameControl];
    }
    else if (indexPath.row == 2)
    {
        NSLog(@"修改年级");
        [self.Delegate setgradeControl];
    }
    else if (indexPath.row == 3)
    {
        NSLog(@"修改性别");
        [self.Delegate setSexControl];
    }
    else
    {
        NSLog(@"修改城市");
        [self.Delegate setCityControl];
    }
//    [self.tableView reloadData];
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
