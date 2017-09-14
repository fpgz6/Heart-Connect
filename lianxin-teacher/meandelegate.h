//
//  meandelegate.h
//  lianxin-teacher
//
//  Created by 朱子江 on 17/5/18.
//  Copyright © 2017年 com.zzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol meandelegate <NSObject>
@optional
-(void)setviewControl;//定义setviewControl方法
-(void)setnameControl;
-(void)setgradeControl;
-(void)setCityControl;
-(void)setSexControl;

-(void)setTeacherControl;
-(void)setZhujiaoControl;
-(void)setCommentControl;
-(void)setAwsControl;
-(void)setCourseControl;

-(void)setCall;

-(void)setPlanControl;
-(void)setMainControl;

@end
