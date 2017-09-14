//
//  DetailPoint.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/20.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "DetailPoint.h"

@implementation DetailPoint
-(id)initwithDict:(NSDictionary *)dict
{
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(id)DetailPointWithDict:(NSDictionary *)dict
{
    return [[self alloc]initwithDict:dict];
}
@end
