//
//  DetaolTeacherViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/19.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "DetaolTeacherViewController.h"
#import "DetailCommentTableViewController.h"
#import "DetailPointTableViewCell.h"
#import "TeacherPointTableViewController.h"
#import "UIKit+AFNetworking.h"
#import "MBProgressHUD+MJ.h"
#import "AFNetworking.h"
#import "HTTPRequestManager.h"
#import "KHTTP.h"
@interface DetaolTeacherViewController ()
{
    UIScrollView *SCroll;//总的scrollview
    UIView *teacherView;//老师信息的view （姓名，年级，教龄，上课时长，价格，图片，学历认证）
    UIView *commentView;//学生评价与老师评分的view（服务评分，效果评分，评论条数，评论内容）
    UITableView *teachPoint;//教学特点，成功案例，教学经历的view
    UIButton *courseBtn;
    UIButton *buyBtn;//购买课程，1对1咨询
    NSArray *arr1;
    UIScrollView  *imgScroll;//教师图片滑动
    NSMutableArray *titelArr;//标题数组
    NSMutableArray *textArr;//内容数组
    UIButton *buybtn;//购买按钮
}

@end
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
static NSString *const teacherTabelIdentifier3 = @"teacherCell3";
@implementation DetaolTeacherViewController

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"教师资料";
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    self.view.backgroundColor = [UIColor grayColor];
    [self mainViewScroll];
    [self caculatePoint];
    [self setTeacherView];
    [self setDetailView];
    [self teacherImgScroll];
    [self setconmmentView];
    [self setPointTabel];
    [self setBuyBtn];
}
//设置购买按钮
-(void)setBuyBtn
{
    buyBtn = [[UIButton alloc]init];
    buyBtn.frame = CGRectMake(20, 520, 100, 100);
    [buyBtn setImage:[UIImage imageNamed:@"buy"] forState:UIControlStateNormal];
    [buyBtn addTarget:self action:@selector(buyBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buyBtn];
}
-(void)buyBtnClick
{
    NSString *titleString = [NSString stringWithFormat:@"购买%@的课程 10课时",self.teachername1];
    NSString *messageString = [NSString stringWithFormat:@"适用范围:%@ 价格为%@",self.gradeLabel.text,self.teacherprice1];
    NSString *title = NSLocalizedString(titleString, nil);
    NSString *message = NSLocalizedString(messageString, nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"取消", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"购买", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //购买功能完成，添加订单课程
        NSDate *senddate = [NSDate date];
        NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
        
        [dateformatter setDateFormat:@"YYYY-MM-dd"];
        
        NSString *date1 = [dateformatter stringFromDate:senddate];
        
        NSLog(@"获取当前时间   = %@",date1);
        NSString *urlPath = [NSString stringWithFormat:@"%@",ADDcourseHttp];
        NSDictionary *dic = @{@"orderdate":date1,@"userid":@1,@"teacherid":@(_teacherid)};
        NSLog(@"教师id%ld",_teacherid);
        NSLog(@"地址为%@",dic);
        [[HTTPRequestManager sharedManager]POST:urlPath withDictionary:dic complete:^(id obj, NSData *data) {
            [MBProgressHUD showSuccess:@"购买成功!"];
        }];
        
        
    }];
    
    // Add the actions.
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//设置老师信息view
-(void)setTeacherView
{
    teacherView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 180)];
    teacherView.backgroundColor = [UIColor whiteColor];
    [SCroll addSubview:teacherView];
}
//老师信息view详细
-(void)setDetailView
{
    NSString *fullPath = [[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:nil];
    NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.frame = CGRectMake(7.5, 7.5, 160,20 );
    self.nameLabel.text = self.teachername1;
    self.nameLabel.font = [UIFont systemFontOfSize:15];
    self.gradeLabel = [[UILabel alloc]init];
    self.gradeLabel.frame = CGRectMake(77.5, 40, 70, 20);
    self.gradeLabel.text = [NSString stringWithFormat:@"%@ %@",self.teachercourse1,_teachergrade1];
    self.gradeLabel.font = [UIFont systemFontOfSize:15];
    
    self.realnameLabel = [[UILabel alloc]init];
    self.realnameLabel.frame = CGRectMake(50, 155, 200, 20);
    self.realnameLabel.font = [UIFont systemFontOfSize:15];
    self.realnameLabel.text = @"实名，学历认证";
    self.priceLabel = [[UILabel alloc]init];
    self.priceLabel.frame = CGRectMake(300, 7.5, 65, 20);
    self.priceLabel.text = self.teacherprice1;
    self.priceLabel.font = [UIFont systemFontOfSize:15];
    self.teachTime = [[UILabel alloc]init];
    self.teachTime.frame = CGRectMake(147.5, 40, 65, 20);
    self.teachTime.text = [NSString stringWithFormat:@"教龄 %@年",self.teacherage1];
    self.teachTime.font = [UIFont systemFontOfSize:15];
    self.attendTime = [[UILabel alloc]init];
    self.attendTime.frame = CGRectMake(217.5, 40, 140, 20);
    self.attendTime.text = [NSString stringWithFormat:@"教学时长 %@小时",self.teachertime1];
    self.attendTime.font = [UIFont systemFontOfSize:15];
    self.img1 = [[UIImageView alloc]init];
    self.img1.frame = CGRectMake(7.5, 40, 60, 20);
    NSString *imagepath = [NSString stringWithFormat:@"%@",self.teacherimg1];
    imagepath = [self stringByDecodingURLFormat:imagepath];
    [self.img1 setImageWithURL:[NSURL URLWithString:[imagepath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]] placeholderImage:nil];
    self.img2 = [[UIImageView alloc]init];
     [self.img2 setImage:[UIImage imageNamed:@"back"]];
    self.img2.frame = CGRectMake(20, 155, 20, 20);
    [teacherView addSubview:self.nameLabel];
    [teacherView addSubview:self.gradeLabel];
    [teacherView addSubview:self.realnameLabel];
    [teacherView addSubview:self.priceLabel];
    [teacherView addSubview:self.teachTime];
    [teacherView addSubview:self.attendTime];
    [teacherView addSubview:self.img1];
    [teacherView addSubview:self.img2];
}
//设置主滑动界面
-(void)mainViewScroll
{
    SCroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 375, 620)];
    SCroll.contentSize = CGSizeMake(375, 1010);
    SCroll.scrollEnabled = YES;
    [self.view addSubview:SCroll];
}

-(void)teacherImgScroll
{
    arr1 = [NSArray arrayWithObjects:@"timg1.jpeg",@"timg2.jpeg",@"timg3.jpeg",@"timg4.jpeg",@"timg5.jpeg",@"timg6.jpeg",@"timg7.jpeg",@"timg8.jpeg", nil];
    //设置图片滚动
    imgScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 65, 365, 80)];
    //设置滚动区域
    imgScroll.contentSize = CGSizeMake(arr1.count*90, 80);
    imgScroll.scrollEnabled = YES;
    for (int i=0; i<arr1.count; i++) {
        UIImageView *teacherimage = [[UIImageView alloc]init];
        teacherimage.frame = CGRectMake(90*i, 0, 80, 80);
        teacherimage.image = [UIImage imageNamed:arr1[i]];
        [imgScroll addSubview:teacherimage];
    }
    [teacherView addSubview:imgScroll];
}
-(void)setconmmentView
{
    commentView = [[UIView alloc]initWithFrame:CGRectMake(0, 190, kScreenW, 100)];
    commentView.backgroundColor = [UIColor whiteColor];
    [SCroll addSubview:commentView];
    self.studentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 25)];
    self.studentLabel.text = @"学生评价";
    self.studentLabel.font = [UIFont systemFontOfSize:15];
    [commentView addSubview:self.studentLabel];
    self.commentImg = [[UIImageView alloc]initWithFrame:CGRectMake(60, 35, 125, 55)];
    self.commentImg.image = [UIImage imageNamed:@"xingxing.jpeg"];
    [commentView addSubview:self.commentImg];
    self.serviceLabel = [[UILabel alloc]initWithFrame:CGRectMake(198, 35, 130, 25)];
    self.serviceLabel.text = @"服务满意率99%";
    self.serviceLabel.font = [UIFont systemFontOfSize:15];
    [commentView addSubview:self.serviceLabel];
    self.effectLabel = [[UILabel alloc]initWithFrame:CGRectMake(198, 65, 130, 25)];
    self.effectLabel.text = @"效果满意率99%";
    self.effectLabel.font = [UIFont systemFontOfSize:15];
    [commentView addSubview:self.effectLabel];
    self.branchNumBtn = [[UIButton alloc]initWithFrame:CGRectMake(300, 10, 60, 25)];
    [self.branchNumBtn setTitle:@"共3条" forState:UIControlStateNormal ];
    [self.branchNumBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.branchNumBtn addTarget:self action:@selector(CommetBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.branchNumBtn setTintColor:[UIColor redColor]];
    [commentView addSubview:self.branchNumBtn];
}

//学生评价按钮点击跳转详细界面
-(void)CommetBtnClick
{
    DetailCommentTableViewController *DetailComm = [[DetailCommentTableViewController alloc]init];
    [self.navigationController pushViewController:DetailComm animated:YES];
}
//设置老师个人信息
-(void)setPointTabel
{
    teachPoint = [[UITableView alloc]initWithFrame:CGRectMake(0, 313, kScreenW, 750)];
    [teachPoint registerClass:[DetailPointTableViewCell class] forCellReuseIdentifier:teacherTabelIdentifier3];
    teachPoint.delegate =self;
    teachPoint.dataSource = self;
    teachPoint.scrollEnabled = NO;
    [SCroll addSubview:teachPoint];
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
    return 250;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailPointTableViewCell *cell = [DetailPointTableViewCell cellWithTableVieW:tableView];
    
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 80, 20)];
    NSArray *array1 = [NSArray arrayWithObjects:@"教学特点",@"成功案例",@"教学经历", nil];
    label1.text = array1[indexPath.row];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 40, 355, 20)];
    NSString *str = [[NSString alloc]init];
    str = [textArr[indexPath.row] stringByRemovingPercentEncoding];
    titleLabel.text = str;
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, 355, 180)];
    textLabel.numberOfLines = 0;
    NSString *str2 = [[NSString alloc]init];
    str2 = [textArr[indexPath.row] stringByRemovingPercentEncoding];
    textLabel.text = str2;
    [cell.contentView addSubview:titleLabel];
    [cell.contentView addSubview:label1];
    [cell.contentView addSubview:textLabel];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeacherPointTableViewController *teacherPoint1 = [[TeacherPointTableViewController alloc]init];
     NSArray *array1 = [NSArray arrayWithObjects:@"教学特点",@"成功案例",@"教学经历", nil];
    teacherPoint1.ViewTitle = array1[indexPath.row];
    teacherPoint1.currentPage = indexPath.row;
    [self.navigationController pushViewController:teacherPoint1 animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)caculatePoint
{
    NSString *PointPath = [[NSBundle mainBundle]pathForResource:@"teacherPoint.plist" ofType:nil];
    NSArray *dictarray = [NSArray arrayWithContentsOfFile:PointPath];
    titelArr = [NSMutableArray array];
    textArr = [NSMutableArray array];
    for (int i=0; i<dictarray.count; i++) {
        NSArray *arr2 = [[NSArray alloc]init];
        arr2 = dictarray[i];
        [titelArr addObject:[arr2[0] valueForKey:@"title"]];
        [textArr addObject:[arr2[0] valueForKey:@"text"]];
    }
    NSLog(@"t1=%@",titelArr);
}

- (NSString *)stringByDecodingURLFormat:(NSString *)str
{
    NSString *result = [str stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
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
