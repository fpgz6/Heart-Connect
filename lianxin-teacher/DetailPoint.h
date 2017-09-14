//
//  DetailPoint.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/20.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailPoint : NSObject
@property (nonatomic,copy) NSString *title1;//标题
@property (nonatomic,copy) NSString *text1;//内容

-(id)initwithDict:(NSDictionary *)dict;
+(id)DetailPointWithDict:(NSDictionary *)dict;
@end
