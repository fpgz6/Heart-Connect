//
//  DetailCommetFrame.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/21.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class DetailCommet;
@interface DetailCommetFrame : NSObject
@property (nonatomic,assign) CGRect  iconF;
@property (nonatomic,assign) CGRect  nameF;
@property (nonatomic,assign) CGRect  gradeF;
@property (nonatomic,assign) CGRect  timeF;
@property (nonatomic,assign) CGRect  commetF;
@property (nonatomic,assign) CGRect  answerF;
@property (nonatomic,assign) CGRect  imgF;
@property (nonatomic,strong) DetailCommet *Comment;
@end
