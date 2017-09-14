//
//  DetailCommet.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/21.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "DetailCommet.h"

@implementation DetailCommet

-(id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(id)CommetWithDict:(NSDictionary *)dict
{
    return [[self alloc]initWithDict:dict];
}
@end
