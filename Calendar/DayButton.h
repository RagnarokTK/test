//
//  DayButton.h
//  Calendar
//
//  Created by tk on 2016/10/13.
//  Copyright © 2016年 tk. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface DayButton : UIButton
@property (nonatomic ) Boolean haveThing;
@property (strong, nonatomic) UIView *thingView;
-(void)setThingViewByBool:(Boolean) haveOrNo;
-(void)clearThingView;
@end
