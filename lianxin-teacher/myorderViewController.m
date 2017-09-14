//
//  myorderViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/17.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "myorderViewController.h"
#import "AFNetworking.h"
#import "KHTTP.h"
#import "MyorderTableViewCell.h"
@interface myorderViewController ()
{
    NSMutableArray *orderArray;
    NSMutableArray *nameArray;
    NSMutableArray *courseArray;
    NSMutableArray *priceArray;
    NSInteger page;
}

@end

@implementation myorderViewController
static NSString *const orderTabelIdentifier = @"orderTableID1";
-(id)init
{
    if ([super init]!=nil) {
        self.title= @"订单";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    page = 0;
    self.view.backgroundColor = [UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f];;
    [self setCourseData];
    //添加选择器
    UIButton *btn1 = [[UIButton alloc]init];
    UIButton *btn2 = [[UIButton alloc]init];
    btn1.frame = CGRectMake(30, 80, 155, 40);
    btn2.frame = CGRectMake(190, 80, 155, 40);
    [btn1 setTitle:@"待付款" forState:UIControlStateNormal];
    [btn2 setTitle:@"全部订单" forState:UIControlStateNormal];
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [btn1 addTarget:self action:@selector(Btn1Click) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(Btn2Click) forControlEvents:UIControlEventTouchUpInside];
//    NSArray *array  = [NSArray arrayWithObjects:@"待付款",@"全部订单", nil];
//    self.Ordersegment = [[UISegmentedControl alloc]initWithItems:array];
//    self.Ordersegment.frame = CGRectMake(30, 80, 315, 40);
//    self.Ordersegment.selectedSegmentIndex = 0;//默认第一个
//    self.Ordersegment.tintColor = [UIColor whiteColor];
////    [self.view addSubview:self.Ordersegment];
//    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIFont systemFontOfSize:18],NSFontAttributeName ,nil];
//    [self.Ordersegment setTitleTextAttributes:dic forState:UIControlStateNormal];
//    UIImage *segmentSelected = [[UIImage imageNamed:@"select"]
//                                resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
//    UIImage *segmentUnSelected = [[UIImage imageNamed:@"unselect"]
//                                  resizableImageWithCapInsets:UIEdgeInsetsMake(0, 15, 0, 15)];
//    // 非选中状态背景图
//    [self.Ordersegment setBackgroundImage:segmentUnSelected
//                            forState:UIControlStateNormal
//                          barMetrics:UIBarMetricsDefault];
//    // 选中状态背景图
//    [self.Ordersegment setBackgroundImage:segmentSelected
//                            forState:UIControlStateSelected
//                          barMetrics:UIBarMetricsDefault];
//    //切换segement动作
//    [self.Ordersegment addTarget:self action:@selector(changeSegment:) forControlEvents:UIControlEventValueChanged];
    
    
    // Do any additional setup after loading the view.
}
-(void)SetOrderTabel
{
    //设置课程
    self.OrderTabel = [[UITableView alloc]initWithFrame:CGRectMake(30, 130, 315, 440)];
    [self.OrderTabel registerClass:[MyorderTableViewCell class] forCellReuseIdentifier:orderTabelIdentifier];
    self.OrderTabel.delegate = self;
    self.OrderTabel.dataSource = self;
    [self.view addSubview:self.OrderTabel];
}
////实现添加的事件
//-(void)changeSegment:(UISegmentedControl *)sender
//{
//    if (sender.selectedSegmentIndex == 0) {
//        NSLog(@"1");
//    }
//    else if (sender.selectedSegmentIndex == 1)
//    {
//        NSLog(@"2");
//    }
//}
-(void)Btn1Click
{
    page = 0;
    [self setCourseData];
}
-(void)Btn2Click
{
    page = 1;
    [self setCourseData];
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
    MyorderTableViewCell *cell = [MyorderTableViewCell cellWithTableVIew:tableView];
    cell.orderPrice.text = [NSString stringWithFormat:@"%@元",priceArray[indexPath.row]];
    cell.orderName.text = [NSString stringWithFormat:@"%@",courseArray[indexPath.row]];
    cell.orderTeacher.text = [NSString stringWithFormat:@"%@",nameArray[indexPath.row]];
    
    cell.orderTime.text = [NSString stringWithFormat:@"%@",[orderArray[indexPath.row] valueForKey:@"orderdate"]];
    cell.orderNum.text =@"10课时";
    cell.backgroundColor = [UIColor colorWithRed:0.78f green:0.96f blue:0.84f alpha:1.00f];
    return cell;
}

-(void)setCourseData
{
    orderArray = [NSMutableArray array];
    nameArray = [NSMutableArray array];
    courseArray = [NSMutableArray array];
    priceArray = [NSMutableArray array];
    AFHTTPRequestOperationManager *manager1 = [[AFHTTPRequestOperationManager alloc]init];
    manager1.responseSerializer = [AFJSONResponseSerializer serializer];
    NSString *urlPath = [NSString stringWithFormat:@"%@%ld",AllPlay,page];
    [manager1 GET:urlPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseDic = (NSDictionary *)responseObject;
        NSString *codeStr = [responseDic valueForKey:@"code"];
        if ([codeStr isEqualToString:@"200"]) {
            NSMutableArray *array = [responseDic objectForKey:@"data"];
            [orderArray addObjectsFromArray:array];
            for (int i=0; i<orderArray.count; i++)
            {
                AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
                manager.responseSerializer = [AFJSONResponseSerializer serializer];
                NSString *urlpath1 = [NSString stringWithFormat:@"%@%@",DetteachermegHttp,[orderArray[i] valueForKey:@"t_teacher_teacherid"]];
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
                         [_OrderTabel reloadData];
                         [self SetOrderTabel];
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
