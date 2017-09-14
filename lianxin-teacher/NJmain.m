//
//  NJmain.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/18.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "NJmain.h"

@implementation NJmain

+(NSMutableArray *)getInstanceByJsonData:(NSData *)data
{
    NSMutableArray *resArray = [[NSMutableArray alloc]init];
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if ([res[@"code"]isEqualToString: @"200"]) {
        NSArray *resArr = res[@"data"];
        for (NSDictionary *appdic in resArr) {
            NJmain *model = [NJmain new];
            [model setValuesForKeysWithDictionary:appdic];
            [resArray addObject:model];
        }
    }
    else
    {}
    return resArray;
}

@end

