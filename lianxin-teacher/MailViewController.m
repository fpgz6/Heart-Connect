//
//  MailViewController.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/30.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "MailViewController.h"
@interface MailViewController ()
{
    UITextView *textView;
    UILabel *placeHolderLabel;
    UIButton *submitBtn;
}

@end

@implementation MailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor colorWithRed:0.85f green:0.97f blue:0.84f alpha:1.00f];
    textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 80, 335, 200)];
    textView.delegate = self;
    [self.view addSubview:textView];
    placeHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    placeHolderLabel.text = @"请输入小于140字";
    [textView addSubview:placeHolderLabel];
    submitBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, 290, 275, 30)];
    submitBtn.backgroundColor = [UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f];
    [submitBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.view addSubview:submitBtn];
    [submitBtn addTarget:self action:@selector(sendMail) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}
-(void)textViewDidChange:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        placeHolderLabel.alpha = 1;
    }
    else
    {
        placeHolderLabel.alpha = 0;
    }
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    placeHolderLabel.alpha = 0;
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    NSLog(@"%@",textView.text);
}
-(void)sendMail
{
    [self.navigationController popViewControllerAnimated:YES];
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
