//
//  DayViewCell.h
//  Calendar
//
//  Created by tk on 16/10/9.
//  Copyright © 2016年 tk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DayButton.h"

typedef void (^SetSelectButtonBlock)(DayButton * btn);


@interface DayViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet DayButton *sundayButton;
@property (strong, nonatomic) IBOutlet DayButton *mondayButton;
@property (strong, nonatomic) IBOutlet DayButton *tuesdayButton;
@property (strong, nonatomic) IBOutlet DayButton *wednesdayButton;
@property (strong, nonatomic) IBOutlet DayButton *thursdayButton;
@property (strong, nonatomic) IBOutlet DayButton *fridayButton;
@property (strong, nonatomic) IBOutlet DayButton *saturdayButton;
@property (nonatomic, strong) SetSelectButtonBlock setSelectButtonBlock;
@property (nonatomic, strong) NSString *weekStr;

-(void) setButtonDay7:(NSString *)num7 Day1:(NSString *)num1 Day2:(NSString *)num2 Day3:(NSString *)num3 Day4:(NSString *)num4 Day5:(NSString *)num5 Day6:(NSString *)num6;
-(void)setButtonColor:(int) index;
-(void)grayOtherDay:(NSUInteger) index;
-(void)clearColor;
-(void)clearThing;
-(void)setThingSign:(NSString *)str;
@end
