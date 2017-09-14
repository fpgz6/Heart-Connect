//
//  DetailCommetFrame.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/21.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "DetailCommetFrame.h"
#import "DetailCommet.h"
@implementation DetailCommetFrame
#define  titleFont [UiFont systemFontOfSzie:15]
#define  textFont [UiFont systemFontOfSzie:13]

-(void)setComment:(DetailCommet *)Comment
{
    _Comment = Comment;
    //设置frame
    self.iconF = CGRectMake(10, 10, 60, 60);
    self.nameF = CGRectMake(75, 10, 100, 20);
    self.gradeF = CGRectMake(170, 10, 60, 20);
    self.timeF =CGRectMake(75, 40, 100, 20);
    self.commetF = CGRectMake(75, 70, 290, 100);
    self.imgF =CGRectMake(75, 190, 60, 20);
    self.answerF = CGRectMake(85, 220, 280, 100);
}

//-(CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize *)maxSize
//{
////    NSDictionary *dict =
//    return size;
//}

@end
