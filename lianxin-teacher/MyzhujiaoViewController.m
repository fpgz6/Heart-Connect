//
//  MyzhujiaoViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/30.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MyzhujiaoViewController.h"

@interface MyzhujiaoViewController ()

@end

@implementation MyzhujiaoViewController

-(id)init
{
    if ([super init]!=nil) {
        self.title= @"我的助教";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _image = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 80, 80)];
    _nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(125, 190, 35, 25)];
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _callBtn = [[UIButton alloc]initWithFrame:CGRectMake(200, 115, 50, 50)];
    _xuanyanImg = [[UIImageView alloc]initWithFrame:CGRectMake(50, 220, 275, 100)];
    _image.image = [UIImage imageNamed:@"teacherPhone"];
    _xuanyanImg.image = [UIImage imageNamed:@"xuanyan.jpeg"];
    [_callBtn setImage:[UIImage imageNamed:@"phoneCall"] forState:UIControlStateNormal];
    _nameLabel.text = @"舒妍";
    [_callBtn addTarget:self action:@selector(setCall1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_image];
    [self.view addSubview:_nameLabel];
    [self.view addSubview:_callBtn];
    [self.view addSubview:_xuanyanImg];
    // Do any additional setup after loading the view.
}
-(void)setCall1
{
    NSString *allString = [NSString stringWithFormat:@"tel:10086"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:allString]];
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
