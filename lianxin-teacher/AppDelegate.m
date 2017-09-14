//
//  AppDelegate.m
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/9.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "ChoiceViewController.h"
#import "ViewController.h"
#import "CourseViewController.h"
#import "AFNetworking.h"
#import "KHTTP.h"
#import "SyetemDefine.h"
#import "MBProgressHUD+MJ.h"
//#import "RootViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
-(BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self automaticLogin];
    NSLog(@"本地数据为%@",APPDELEGATE.currentUser);
    return YES;
}
-(void)automaticLogin
{
    AFHTTPRequestOperationManager *manager= [[AFHTTPRequestOperationManager alloc]init];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSString *urlPath = [NSString stringWithFormat:@"%@%d",UserMsgHttp,1];
    [manager GET:urlPath parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                NSString *codeStr = [responseDic valueForKey:@"code"];
        if ([codeStr isEqualToString:@"200"]) {
                        NSDictionary *dictTemp = [responseDic objectForKey:@"data"][0];
                        User *user = [[User alloc]init];
                        user = [User getInstanceByDic:dictTemp];
                        APPDELEGATE.currentUser = user;
                    }
        else
        {
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
//    NSInteger password = 1;
//    NSDictionary *LoginDic = @{@"userid":@1,@"userpassword":@(password) };
//    NSLog(@"地址为%@",LoginDic);
//    [manager POST:urlPath parameters:LoginDic success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSDictionary *responseDic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSString *codeStr = [responseDic valueForKey:@"code"];
//        NSString *msg = [responseDic valueForKey:@"msg"];
//        if ([codeStr isEqualToString:@"200"]) {
//            //登录成功
//            //            NSLog(@"登录成功");
//            //            [MBProgressHUD showSuccess:msg];
//            NSDictionary *dictTemp = [responseDic objectForKey:@"data"];
//            User *user = [[User alloc]init];
//            user = [User getInstanceByDic:dictTemp];
//            APPDELEGATE.currentUser = user;
//        }
//        else
//        {
//            [MBProgressHUD showError:msg];
//        }
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [MBProgressHUD showError:@"网络不通畅，请检查网络"];
//        
//    }];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //1.创建Window
         self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
         self.window.backgroundColor = [UIColor whiteColor];
    
        //a.初始化一个tabBar控制器
         UITabBarController *tb=[[UITabBarController alloc]init];
         //设置控制器为Window的根控制器
         self.window.rootViewController=tb;
    
         //b.创建子控制器
         MainViewController *c1=[[MainViewController alloc]init];
         UINavigationController *navmain = [[UINavigationController  alloc]initWithRootViewController:c1];
    navmain.tabBarItem.image = [[UIImage imageNamed:@"酒店@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
         c1.view.backgroundColor=[UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f];;
    
         CourseViewController *c3=[[CourseViewController alloc]init];
    UINavigationController *navcourse = [[UINavigationController  alloc]initWithRootViewController:c3];
    navcourse.tabBarItem.image = [[UIImage imageNamed:@"shop_selected@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
         c3.view.backgroundColor=[UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f];;
    
         ViewController *c4=[[ViewController alloc]init];
    UINavigationController *navmy = [[UINavigationController  alloc]initWithRootViewController:c4];
    navmy.tabBarItem.image = [[UIImage imageNamed:@"mine_selected@2x"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
         //  添加子控制器navigation
         tb.viewControllers=@[navmain,navcourse,navmy];
    ChoiceViewController *c2=[[ChoiceViewController alloc]init];
    UINavigationController *navchoice = [[UINavigationController  alloc]initWithRootViewController:c2];
    navchoice.tabBarItem.image = [[UIImage imageNamed:@"b27_icon_star_gray"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    c2.view.backgroundColor=[UIColor colorWithRed:0.22f green:0.80f blue:0.47f alpha:1.00f];;
    
    
         //2.设置Window为主窗口并显示出来
         [self.window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
