//
//  DetailCommet.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/21.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailCommet : NSObject
@property (nonatomic,copy) NSString *headimage;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *grade;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *comme;
@property (nonatomic,copy) NSString *answer;


-(id)initWithDict:(NSDictionary *)dict;
+(id)CommetWithDict:(NSDictionary *)dict;
@end
