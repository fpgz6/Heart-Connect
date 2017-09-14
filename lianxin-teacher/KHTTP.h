//
//  KHTTP.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/6/1.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#ifndef KHTTP_h
#define KHTTP_h
//登录
#define loginHttp @"http://127.0.0.1/HeartConnect/index.php/home/User/login"
//根据课程筛选老师
#define teachermegHttp @"http://127.0.0.1/HeartConnect/index.php/home/teacher/teachermeg?teachercourse="
//根据老师id取信息
#define DetteachermegHttp @"http://127.0.0.1/HeartConnect/index.php/home/teacher/Detteachermeg?teacherid="
//根据用户id取信息
#define UserMsgHttp @"http://127.0.0.1/HeartConnect/index.php/home/User/quan?userid="
//根据用户id＋是否结课id来获取数据
#define AllCourseHttp @"http://127.0.0.1/HeartConnect/index.php/home/teacher/allcourse?userid=1&myordered="
//根据用户id＋是否付款id来获取数据
#define AllPlay @"http://127.0.0.1/HeartConnect/index.php/home/teacher/allpay?userid=1&myorderis="
//根据用户id获得所有学习计划
#define ALLorder @"http://127.0.0.1/HeartConnect/index.php/home/teacher/allorder?userid=1"
//添加订单
#define ADDcourseHttp @"http://127.0.0.1/HeartConnect/index.php/home/teacher/addcourse"
//根据用户id取评论信息
#define getComment @"http://127.0.0.1/HeartConnect/index.php/home/teacher/getCommet?userid="
//修改钱包
#define changemoney @"http://127.0.0.1/HeartConnect/index.php/home/User/changemoney"
//修改密码
#define changepassword @"http://127.0.0.1/HeartConnect/index.php/home/User/changepassword"
//修改名称
#define changename @"http://127.0.0.1/HeartConnect/index.php/home/User/changename"
//修改年级
#define changegrade @"http://127.0.0.1/HeartConnect/index.php/home/User/changegrade"
//修改性别
#define changesex @"http://127.0.0.1/HeartConnect/index.php/home/User/changesex"
//修改城市
#define changecity @"http://127.0.0.1/HeartConnect/index.php/home/User/changecity"
//添加钱包纪录
#define AddMoney @"http://127.0.0.1/HeartConnect/index.php/home/teacher/addmoney"
//获取钱包纪录
#define GetMoney @"http://127.0.0.1/HeartConnect/index.php/home/teacher/getmoney?userid="
#endif /* KHTTP_h */
