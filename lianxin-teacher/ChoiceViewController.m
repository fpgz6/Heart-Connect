//
//  ChoiceViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/9.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "ChoiceViewController.h"
#import "NJmain.h"
#import "ChoiceTableViewCell.h"
#import "DetaolTeacherViewController.h"
#import "AFNetworking.h"
#import "KHTTP.h"
#import "HTTPRequestManager.h"
#import "UIKit+AFNetworking.h"
@interface ChoiceViewController ()
{
    UILabel *labal2;
    UITableView *teachTabel;//老师信息表
    NSArray *courseArray;
    NSArray  *gradeArray;
    NSInteger _currentPage;
    NSInteger _courseIndex;
    NSMutableArray *teacherdataArr;
}
@property (nonatomic,strong)NSArray *statusFrames;
@end
static NSString *const teacherTabelIdentifier1 = @"teacherCell1";
@implementation ChoiceViewController
-(id)init
{
    if ([super init]!=nil) {
        self.title= @"帮我选";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _currentPage = 0;
    courseArray = [NSArray arrayWithObjects:@"语文",@"数学",@"英语",@"物理",@"化学",@"生物",@"地理",@"历史", @"政治",nil];
    gradeArray = [NSArray arrayWithObjects:@"小学",@"初中",@"高中", nil];
    labal2 = [[UILabel alloc]initWithFrame:CGRectMake(200, 200, 300, 300)];
    labal2.text = @"帮我选";
//    [self teacherData];
    [self.view addSubview:labal2];
    [self setteacherCroll];
    // Do any additional setup after loading the view.
}
-(void)setteacherCroll
{
    teachTabel = [[UITableView alloc]init];
    [teachTabel registerClass:[ChoiceTableViewCell class] forCellReuseIdentifier:teacherTabelIdentifier1];
    teachTabel.frame = CGRectMake(0, 80, 375, 535);
    teachTabel.delegate = self;
    teachTabel.dataSource = self;
    [self.view addSubview:teachTabel];
}
//教师信息table具体cell
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return teacherdataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
//-(NSString *)tab
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChoiceTableViewCell *cell1 = [ChoiceTableViewCell cellWithTableView:tableView];
    //设置数据
    cell1
    .courseLabel.text = [NSString stringWithFormat:@"%@",courseArray[[teacherdataArr[indexPath.row] teachercourse]]];
    cell1.nameLabel.text = [NSString stringWithFormat:@"%@",[teacherdataArr[indexPath.row] teachername]];
    cell1.gradeLabel.text = [NSString stringWithFormat:@"%@",gradeArray[[teacherdataArr[indexPath.row] teachergrade]]];
    cell1.distanceLabel.text = [NSString stringWithFormat:@"%0.1f km",[teacherdataArr[indexPath.row] teacherdistance]];
    cell1.priceLabel.text = [NSString stringWithFormat:@"%0.1f 元",[teacherdataArr[indexPath.row] teacherprice]];
    NSString *imagePath = [NSString stringWithFormat:@"http://127.0.0.1/HeartConnect/Home/images%@",[teacherdataArr[indexPath.row] teacherimg]];
    imagePath = [self stringByDecodingURLFormat:imagePath];
    [cell1.iconView setImageWithURL:[NSURL URLWithString:[imagePath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]] placeholderImage:nil];
    return cell1;
}
-(void)teacherData
{
    teacherdataArr = [NSMutableArray array];
    NSString *urlPath1  = [NSString stringWithFormat:@"%@%ld",teachermegHttp,(long)_currentPage];
    [[HTTPRequestManager sharedManager]GET:urlPath1 complete:^(id obj, NSData *data) {
        NSMutableArray *arr = [NJmain getInstanceByJsonData:data];
        [teacherdataArr addObjectsFromArray:arr];
//        NSLog(@"数据2=%@",teacherdataArr);
        [teachTabel reloadData];
    }];
}

//点击cell跳转老师详细信息
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetaolTeacherViewController *detailTeacher = [[DetaolTeacherViewController alloc]init];
    detailTeacher.page = indexPath.row;
    [self.navigationController pushViewController:detailTeacher animated:YES];
}

- (NSString *)stringByDecodingURLFormat:(NSString *)str
{
    NSString *result = [str stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
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
