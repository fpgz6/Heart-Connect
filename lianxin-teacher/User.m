//
//  User.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/6/3.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "User.h"

@implementation User
+(User *)getInstanceByDic:(NSDictionary *)dic
{
    User *user = [[User alloc]init];
    user.userid = [[dic valueForKey:@"userid"]intValue];
    user.username = [dic valueForKey:@"username"];
    user.userpassword = [dic valueForKey:@"userpassword"];
    user.userheadimg = [dic valueForKey:@"userheadimg"];
    user.usergrade = [[dic valueForKey:@"usergrade"]intValue];
    user.usersex = [[dic valueForKey:@"usersex"]intValue];
    user.usercity = [[dic valueForKey:@"usercity"]intValue];
    user.userphone = [[dic valueForKey:@"userphone"]intValue];
    user.usermoney = [[dic valueForKey:@"usermoney"]floatValue];
    user.userzhujiaoname = [dic valueForKey:@"userzhujiaoname"];
    user.userzhujiaophone = [[dic valueForKey:@"userzhujiaophone"]intValue];
    user.userarea = [dic valueForKey:@"userarea"];
    user.userplace = [dic valueForKey:@"userplace"];
    return user;
}
@end
