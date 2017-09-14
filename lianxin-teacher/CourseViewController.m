//
//  CourseViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/9.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "CourseViewController.h"
#import "AFNetworking.h"
#import "KHTTP.h"
@interface CourseViewController ()
{
    UILabel *label1;
    NSInteger page;
    NSMutableDictionary *OrderDic;
    NSMutableArray *OrderArray;
    NSMutableArray *nameArray;
    NSMutableArray *courseArray;
    NSMutableArray *priceArray;
    UIScrollView *kechengScroll;
    NSArray *kechengArr;
    NSInteger _currentPage;
}
@property (nonatomic,strong) UIButton *SelectBtn;//课程选择按钮列表


@end
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
static NSString *const courseTabelIdentifier = @"courseTableID1";

@implementation CourseViewController
-(id)init
{
    if ([super init]!=nil) {
        self.title= @"课程";
    }
    return self;
}

- (void)viewDidLoad {
    
    //添加选择器
    NSArray *array  = [NSArray arrayWithObjects:@"未上课",@"待结课",@"待评价",@"已结束", nil];
    self.segment = [[UISegmentedControl alloc]initWithItems:array];
    self.segment.frame = CGRectMake(30, 80, 315, 40);
    self.segment.selectedSegmentIndex = 0;//默认第一个
    self.segment.tintColor = [UIColor whiteColor];
    [self.view addSubview:self.segment];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName ,nil];
    [self.segment setTitleTextAttributes:dic forState:UIControlStateNormal];
    UIImage *segmentSelected = [[UIImage imageNamed:@"select"]
                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
    UIImage *segmentUnSelected = [[UIImage imageNamed:@"unselect"]
                                  resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
    // 非选中状态背景图
    [self.segment setBackgroundImage:segmentUnSelected
                            forState:UIControlStateNormal
                          barMetrics:UIBarMetricsDefault];
    // 选中状态背景图
    [self.segment setBackgroundImage:segmentSelected
                            forState:UIControlStateSelected
                          barMetrics:UIBarMetricsDefault];
    //切换segement动作
    [self.segment addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
//    [self setCourseScroll];
    [self setOrderData];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
//课程选择scroll
-(void)setCourseScroll
{
    kechengArr = [NSArray arrayWithObjects:@"未上课",@"待结课",@"待评价",@"已结束", nil];
    kechengScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 80, kScreenW, 40)];
    CGFloat btnW = kScreenW/4;
    CGFloat btnH = 40;
    for (int i= 0; i<kechengArr.count; i++) {
        UIButton *btn = [[UIButton alloc]init];
        btn.frame = CGRectMake(btnW *i, 0, btnW, btnH);
        [btn setTitle:kechengArr[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:0.78f green:0.96f blue:0.84f alpha:1.00f] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(topTitleBtnClick:) forControlEvents:UIControlEventTouchDown];
        btn.tag = 100+i;
        [kechengScroll addSubview:btn];
        kechengScroll.contentSize = CGSizeMake(btnW*kechengArr.count, 0);
        kechengScroll.backgroundColor = [UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f];
    }
    [self.view addSubview:kechengScroll];
}
-(void)topTitleBtnClick:(UIButton *)btn
{
    [self selctedBtn1:btn];
}
//让标题居中
- (void)setupTitleButtonCenter1:(UIButton *)button
{
    // 修改偏移量
    CGFloat offsetX = button.center.x - kScreenW * 0.5;
    
    // 处理最小滚动偏移量
    if (offsetX < 0) {
        offsetX = 0;
    }
    // 处理最大滚动偏移量
    CGFloat maxOffsetX = kechengScroll.contentSize.width - kScreenW;
    if (offsetX > maxOffsetX) {
        offsetX = maxOffsetX;
    }
    [kechengScroll setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (void)selctedBtn1:(UIButton *)btn
{
    _currentPage = 0;
    [_SelectBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self setupTitleButtonCenter1:btn];
    _SelectBtn.transform = CGAffineTransformIdentity;
    btn.transform = CGAffineTransformMakeScale(1.3, 1.3);
    _SelectBtn = btn;
    _currentPage = btn.tag - 100;
    [self setOrderData];
}


-(void)setMainView
{
    //设置课程
    self.courseTabel = [[UITableView alloc]initWithFrame:CGRectMake(30, 130, 315, 440)];
    [self.courseTabel registerClass:[CourseTableViewCell class] forCellReuseIdentifier:courseTabelIdentifier];
    self.courseTabel.delegate = self;
    self.courseTabel.dataSource = self;
    self.courseTabel.backgroundColor =[UIColor colorWithRed:0.78f green:0.96f blue:0.84f alpha:1.00f];
    [self.view addSubview:self.courseTabel];
}

//实现添加的事件
-(void)changeSegment:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0) {
        page = 0;
    }
    else if (sender.selectedSegmentIndex == 1)
    {
        page = 1;
    }
    else if (sender.selectedSegmentIndex == 2)
    {
        page = 2;
    }
    else if (sender.selectedSegmentIndex == 3)
    {
        page = 3;
    }
    [self setOrderData];
    [_courseTabel reloadData];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return nameArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CourseTableViewCell *cell = [CourseTableViewCell cellWithTableVIew:tableView];
    cell.coursePrice.text = [NSString stringWithFormat:@"%@元",priceArray[indexPath.row]];
    cell.courseName.text = [NSString stringWithFormat:@"%@",courseArray[indexPath.row]];
    cell.courseTeacher.text = [NSString stringWithFormat:@"%@",nameArray[indexPath.row]];
    
    cell.courseTime.text = [NSString stringWithFormat:@"%@",[OrderArray[indexPath.row] valueForKey:@"orderdate"]];
    cell.courseNum.text =@"10课时";
    cell.backgroundColor = [UIColor colorWithRed:0.78f green:0.96f blue:0.84f alpha:1.00f];
    return cell;
}
//设置数据源
-(void)setOrderData
{
    OrderArray = [NSMutableArray array];
    nameArray = [NSMutableArray array];
    courseArray = [NSMutableArray array];
    priceArray = [NSMutableArray array];
    AFHTTPRequestOperationManager *manager1 = [[AFHTTPRequestOperationManager alloc]init];
    manager1.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *urlPath = [NSString stringWithFormat:@"%@%ld",AllCourseHttp,page];
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
                        //价格
                        NSInteger priceint = [[[responseDict objectForKey:@"data"][0] valueForKey:@"teacherprice"] integerValue];
                        NSString *price =[NSString stringWithFormat:@"%ld",priceint];
                        [priceArray addObject:price];
                        [_courseTabel reloadData];
                        [self setMainView];
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
