//
//  NJmain.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/18.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJmain : NSObject
@property (nonatomic,assign) NSInteger teacherid;
@property (nonatomic, copy) NSString *teachername; // 姓名
@property (nonatomic, copy) NSString *teacherimg; // 头像
@property (nonatomic,assign) NSInteger teachercourse;//课程
@property (nonatomic, assign) NSInteger teachergrade; // 年级
@property (nonatomic, assign) float teacherdistance; // 距离
@property (nonatomic, assign) float teacherprice; // 价格
@property (nonatomic,assign) NSInteger teacherage;//教龄
@property (nonatomic,assign) NSInteger teachertime;//教学时间

+(NSMutableArray *)getInstanceByJsonData:(NSData *)data;

@end
