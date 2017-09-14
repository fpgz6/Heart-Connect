//
//  MainViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/9.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MainViewController.h"
#import "SearchViewController.h"
#import "NJmain.h"
#import "MainTableViewCell.h"
#import "DetaolTeacherViewController.h"
#import "AFNetworking.h"
#import "KHTTP.h"
#import "HTTPRequestManager.h"
#import "UIKit+AFNetworking.h"
@interface MainViewController ()
{
    UILabel *label3;//测试label
    UIScrollView *imageScroll;//创建一个滑动图片的scrollview
    UITableView *teacherTable;//创建老师信息的tableview
    UIScrollView *courseScroll;//创建课程选择的scrollview
    UISearchBar *search;//创建搜素栏
    NSInteger _currentPage;
    NSArray *courseArr;
    UIImageView *img1;
    NSMutableArray *namearray;
    NSMutableArray *teacherDataArr;
    NSArray *courseArray;
    NSArray  *gradeArray;
}
@property (nonatomic,strong) UIButton *SelectBtn1;//课程选择按钮列表

@end
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
static NSString *const teacherTabelIdentifier = @"teacherCell";
@implementation MainViewController
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];//隐藏导航栏
}

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"首页";
    }
    return self;
}

- (void)viewDidLoad {
    courseArray = [NSArray arrayWithObjects:@"",@"语文",@"数学",@"英语",@"物理",@"化学",@"生物",@"政治",@"地理", @"历史",nil];
    gradeArray = [NSArray arrayWithObjects:@"小学",@"初中",@"高中", nil];
    [super viewDidLoad];
    _currentPage = 0;
    label3 = [[UILabel alloc]initWithFrame:CGRectMake(120, 190, 135, 60)];
    label3.text= @"专属推荐";
    label3.backgroundColor = [UIColor colorWithRed:0.78f green:0.96f blue:0.84f alpha:1.00f];
    label3.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label3];
    namearray = [NSMutableArray array];
    [self setImageScroll];
    [self setCourseScroll1];//课程滑动
    [self setTeacherScroll];//教师信息表
    [self teacherDataSourse];//老师信息数据源
}
//搜索栏
-(void)setSearchBar
{
    search = [[UISearchBar alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 -100, 20, 200, 30)];
    search.delegate = self;
    [search setBackgroundColor:[UIColor whiteColor]];
    search.placeholder = @"请输入老师/科目/年级/特点";
    search.layer.cornerRadius = 13;
    search.layer.masksToBounds = YES;
    [search.layer setBorderWidth:0];
    [search.layer setBorderColor:[UIColor whiteColor].CGColor];
    search.showsCancelButton = NO;
    [self.view addSubview:search];
}
//点击搜索框开始时
-(void)searchBarTextDidEndEditing:(UISearchBar *)searchBar
{
    SearchViewController *mysearch = [[SearchViewController alloc]init];
    [self.navigationController pushViewController:mysearch animated:YES];
}
//滑动图片scroll
-(void)setImageScroll
{
    img1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"zhanfang.jpeg"]];
    img1.frame = CGRectMake(0, 0, kScreenW, 150);
    [self.view addSubview:img1];
}
//课程选择scroll
-(void)setCourseScroll1
{
    courseArr = [NSArray arrayWithObjects:@"全部",@"语文",@"数学",@"英语",@"物理",@"化学",@"生物",@"政治",@"地理",@"历史", nil];
    courseScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 155, kScreenW, 30)];
    CGFloat btnW = kScreenW/5;
    CGFloat btnH = 30;
    for (int i= 0; i<courseArr.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(btnW *i, 0, btnW, btnH);
        [btn setTitle:courseArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:0.78f green:0.96f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(topTitleBtnClick:) forControlEvents:UIControlEventTouchDown];
        btn.tag = 100+i;
        [courseScroll addSubview:btn];
        courseScroll.contentSize = CGSizeMake(btnW*courseArr.count, 0);
        courseScroll.backgroundColor = [UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f];
    }
    [self.view addSubview:courseScroll];
}
-(void)topTitleBtnClick:(UIButton *)btn
{
    [self selctedBtn:btn];
}
//让标题居中
- (void)setupTitleButtonCenter:(UIButton *)button
{
    // 修改偏移量
    CGFloat offsetX = button.center.x - kScreenW * 0.5;
    
    // 处理最小滚动偏移量
    if (offsetX < 0) {
        offsetX = 0;
    }
    // 处理最大滚动偏移量
    CGFloat maxOffsetX = courseScroll.contentSize.width - kScreenW;
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    [courseScroll setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (void)selctedBtn:(UIButton *)btn
{
    _currentPage = 0;
    [_SelectBtn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self setupTitleButtonCenter:btn];
    _SelectBtn1.transform = CGAffineTransformIdentity;
    btn.transform = CGAffineTransformMakeScale(1.3, 1.3);
    _SelectBtn1 = btn;
    _currentPage = btn.tag - 100;
    [self teacherDataSourse];
}
//老师信息table
-(void)setTeacherScroll
{
    teacherTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 255, kScreenW, 667-225-80) style:UITableViewStylePlain];
    [teacherTable registerClass:[MainTableViewCell class] forCellReuseIdentifier:teacherTabelIdentifier];
    teacherTable.delegate =self;
    teacherTable.dataSource = self;
    [self.view addSubview: teacherTable];
}
//教师信息table具体cell
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return teacherDataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
//-(NSString *)tab
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MainTableViewCell *cell = [MainTableViewCell cellWithTableView:tableView];
    //设置数据
    cell.courseLabel.text = [NSString stringWithFormat:@"%@",courseArray[[teacherDataArr[indexPath.row] teachercourse]]];
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",[teacherDataArr[indexPath.row] teachername]];
    cell.gradeLabel.text = [NSString stringWithFormat:@"%@",gradeArray[[teacherDataArr[indexPath.row] teachergrade]]];
    cell.distanceLabel.text = [NSString stringWithFormat:@"%0.1f km",[teacherDataArr[indexPath.row] teacherdistance]];
    cell.priceLabel.text = [NSString stringWithFormat:@"%0.1f 元",[teacherDataArr[indexPath.row] teacherprice]];
    NSString *imagePath = [NSString stringWithFormat:@"http://127.0.0.1/HeartConnect/Home/images%@",[teacherDataArr[indexPath.row] teacherimg]];
    imagePath = [self stringByDecodingURLFormat:imagePath];
    [cell.iconView setImageWithURL:[NSURL URLWithString:[imagePath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]] placeholderImage:nil];
    return cell;
}
//点击cell跳转老师详细信息
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetaolTeacherViewController *detailTeacher = [[DetaolTeacherViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    detailTeacher.teacherid = [teacherDataArr[indexPath.row] teacherid];
    detailTeacher.teachername1 =[NSString stringWithFormat:@"%@",[teacherDataArr[indexPath.row] teachername]];
    detailTeacher.teachergrade1 = [NSString stringWithFormat:@"%@",gradeArray[[teacherDataArr[indexPath.row] teachergrade]]];
    detailTeacher.teachercourse1 = [NSString stringWithFormat:@"%@",courseArray[[teacherDataArr[indexPath.row] teachercourse]]];
    detailTeacher.teacherage1 = [NSString stringWithFormat:@"%ld",[teacherDataArr[indexPath.row] teacherage]];
    detailTeacher.teachertime1 = [NSString stringWithFormat:@"%ld",[teacherDataArr[indexPath.row] teachertime]];
    detailTeacher.teacherprice1 = [NSString stringWithFormat:@"%0.1f 元",[teacherDataArr[indexPath.row] teacherprice]];
    detailTeacher.teacherimg1 = [NSString stringWithFormat:@"http://127.0.0.1/HeartConnect/Home/images%@",[teacherDataArr[indexPath.row] teacherimg]];
    [self.navigationController pushViewController:detailTeacher animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

//数据源
-(void)teacherDataSourse
{
    teacherDataArr = [NSMutableArray array];
    NSString *urlPath  = [NSString stringWithFormat:@"%@%ld",teachermegHttp,(long)_currentPage];
    [[HTTPRequestManager sharedManager]GET:urlPath complete:^(id obj, NSData *data) {
        NSMutableArray *arr = [NJmain getInstanceByJsonData:data];
        [teacherDataArr addObjectsFromArray:arr];
        [teacherTable reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
