//
//  DayViewCell.m
//  Calendar
//
//  Created by tk on 16/10/9.
//  Copyright © 2016年 tk. All rights reserved.
//

#import "DayViewCell.h"
@interface DayViewCell()


@end
@implementation DayViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.sundayButton setTag:0];
    [self.mondayButton setTag:1];
    [self.tuesdayButton setTag:2];
    [self.wednesdayButton setTag:3];
    [self.thursdayButton setTag:4];
    [self.fridayButton setTag:5];
    [self.saturdayButton setTag:6];
   
    self.sundayButton.layer.cornerRadius=([UIScreen mainScreen].bounds.size.width/7-4)/2;
    self.mondayButton.layer.cornerRadius=([UIScreen mainScreen].bounds.size.width/7-4)/2;
    self.tuesdayButton.layer.cornerRadius=([UIScreen mainScreen].bounds.size.width/7-4)/2;
    self.wednesdayButton.layer.cornerRadius=([UIScreen mainScreen].bounds.size.width/7-4)/2;
    self.thursdayButton.layer.cornerRadius=([UIScreen mainScreen].bounds.size.width/7-4)/2;
    self.fridayButton.layer.cornerRadius=([UIScreen mainScreen].bounds.size.width/7-4)/2;
    self.saturdayButton.layer.cornerRadius=([UIScreen mainScreen].bounds.size.width/7-4)/2;



}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setButtonDay7:(NSString *)num7 Day1:(NSString *)num1 Day2:(NSString *)num2 Day3:(NSString *)num3 Day4:(NSString *)num4 Day5:(NSString *)num5 Day6:(NSString *)num6{
    [self.sundayButton setTitle:num7 forState:UIControlStateNormal];
    self.sundayButton.titleLabel.text=num7;
    
    [self.mondayButton setTitle:num1 forState:UIControlStateNormal];
    self.mondayButton.titleLabel.text=num1;

    [self.tuesdayButton setTitle:num2 forState:UIControlStateNormal];
    self.tuesdayButton.titleLabel.text=num2;

    [self.wednesdayButton setTitle:num3 forState:UIControlStateNormal];
    self.wednesdayButton.titleLabel.text=num3;

    [self.thursdayButton setTitle:num4 forState:UIControlStateNormal];
    self.thursdayButton.titleLabel.text=num4;

    [self.fridayButton setTitle:num5 forState:UIControlStateNormal];
    self.fridayButton.titleLabel.text=num5;

    [self.saturdayButton setTitle:num6 forState:UIControlStateNormal];
    self.saturdayButton.titleLabel.text=num6;

    
    

}

-(void)setButtonColor:(int) index{
    switch (index) {
        case 0:
            [self.sundayButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.sundayButton.layer setBorderWidth:1.0];
            [self.sundayButton.layer setBorderColor:[UIColor blueColor].CGColor];
            break;
        case 1:
            [self.mondayButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.mondayButton.layer setBorderWidth:1.0];
            [self.mondayButton.layer setBorderColor:[UIColor blueColor].CGColor];
            break;
        case 2:
            [self.tuesdayButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.tuesdayButton.layer setBorderWidth:1.0];
            [self.tuesdayButton.layer setBorderColor:[UIColor blueColor].CGColor];
            break;
        case 3:
            [self.wednesdayButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.wednesdayButton.layer setBorderWidth:1.0];
            [self.wednesdayButton.layer setBorderColor:[UIColor blueColor].CGColor];
            break;
        case 4:
            [self.thursdayButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.thursdayButton.layer setBorderWidth:1.0];
            [self.thursdayButton.layer setBorderColor:[UIColor blueColor].CGColor];
            break;
        case 5:
            [self.fridayButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.fridayButton.layer setBorderWidth:1.0];
            [self.fridayButton.layer setBorderColor:[UIColor blueColor].CGColor];
            break;
        case 6:
            [self.saturdayButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [self.saturdayButton.layer setBorderWidth:1.0];
            [self.saturdayButton.layer setBorderColor:[UIColor blueColor].CGColor];
            break;
        default:
            break;
    }


}
-(void)clearColor{
  [self.sundayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
   
    [self.mondayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.tuesdayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.wednesdayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.thursdayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.fridayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.saturdayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.sundayButton.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.mondayButton.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.tuesdayButton.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.wednesdayButton.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.thursdayButton.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.fridayButton.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.saturdayButton.layer setBorderColor:[UIColor clearColor].CGColor];

    
}

-(void)grayOtherDay:(NSUInteger) index{
    switch (index) {
        case 0:
            [self.sundayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            break;
        case 1:
            [self.mondayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            break;
        case 2:
            [self.tuesdayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            break;
        case 3:
            [self.wednesdayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            break;
        case 4:
            [self.thursdayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            break;
        case 5:
            [self.fridayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            break;
        case 6:
            [self.saturdayButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            break;
        default:
            break;
    }


}



- (IBAction)selectButton:(DayButton *)sender {
    
    if (self.setSelectButtonBlock) {
        self.setSelectButtonBlock(sender);
    }
    
}

-(void)setThingSign:(NSString *)str{
  
    if (([self.sundayButton.titleLabel.textColor isEqual:[UIColor blackColor]]||[self.sundayButton.titleLabel.textColor isEqual:[UIColor redColor]])&&[self.sundayButton.titleLabel.text isEqualToString:str]) {
        self.sundayButton.haveThing=YES;
        [self.sundayButton setThingViewByBool:self.sundayButton.haveThing];
        NSLog(@"%@",self.sundayButton.titleLabel.text);
        NSLog(@"11111111");
    }


    if (([self.mondayButton.titleLabel.textColor isEqual:[UIColor blackColor]]||[self.sundayButton.titleLabel.textColor isEqual:[UIColor redColor]])&&[self.mondayButton.titleLabel.text isEqualToString:str]) {
        self.mondayButton.haveThing=YES;
        [self.mondayButton setThingViewByBool:self.mondayButton.haveThing];
        NSLog(@"%@",self.mondayButton.titleLabel.text);
        NSLog(@"11111111");
      
    }
    if (([self.tuesdayButton.titleLabel.textColor isEqual:[UIColor blackColor]]||[self.sundayButton.titleLabel.textColor isEqual:[UIColor redColor]])&&[self.tuesdayButton.titleLabel.text isEqualToString:str]) {
        self.tuesdayButton.haveThing=YES;
        [self.tuesdayButton setThingViewByBool:self.tuesdayButton.haveThing];
    }
    if (([self.wednesdayButton.titleLabel.textColor isEqual:[UIColor blackColor]]||[self.sundayButton.titleLabel.textColor isEqual:[UIColor redColor]])&&[self.wednesdayButton.titleLabel.text isEqualToString:str]) {
        self.wednesdayButton.haveThing=YES;
        [self.wednesdayButton setThingViewByBool:self.wednesdayButton.haveThing];
    }
    if (([self.thursdayButton.titleLabel.textColor isEqual:[UIColor blackColor]]||[self.sundayButton.titleLabel.textColor isEqual:[UIColor redColor]])&&[self.thursdayButton.titleLabel.text isEqualToString:str]) {
        self.thursdayButton.haveThing=YES;
        [self.thursdayButton setThingViewByBool:self.thursdayButton.haveThing];
    }
    if (([self.fridayButton.titleLabel.textColor isEqual:[UIColor blackColor]]||[self.sundayButton.titleLabel.textColor isEqual:[UIColor redColor]])&&[self.fridayButton.titleLabel.text isEqualToString:str]) {
        self.fridayButton.haveThing=YES;
        [self.fridayButton setThingViewByBool:self.fridayButton.haveThing];
    }
    
    if (([self.saturdayButton.titleLabel.textColor isEqual:[UIColor blackColor]]||[self.sundayButton.titleLabel.textColor isEqual:[UIColor redColor]])&&[self.saturdayButton.titleLabel.text isEqualToString:str]) {
        self.saturdayButton.haveThing=YES;
        [self.saturdayButton setThingViewByBool:self.saturdayButton.haveThing];
    }


}

-(void)clearThing{
    self.sundayButton.haveThing=NO;
    [self.sundayButton setThingViewByBool:self.sundayButton.haveThing];
    [self.sundayButton clearThingView];
    
    self.mondayButton.haveThing=NO;
    [self.mondayButton setThingViewByBool:self.mondayButton.haveThing];
    [self.mondayButton clearThingView];

    self.tuesdayButton.haveThing=NO;
    [self.tuesdayButton setThingViewByBool:self.tuesdayButton.haveThing];
    [self.tuesdayButton clearThingView];

    self.wednesdayButton.haveThing=NO;
    [self.wednesdayButton setThingViewByBool:self.wednesdayButton.haveThing];
    [self.wednesdayButton clearThingView];

    self.thursdayButton.haveThing=NO;
    [self.thursdayButton setThingViewByBool:self.thursdayButton.haveThing];
    [self.thursdayButton clearThingView];

    self.fridayButton.haveThing=NO;
    [self.fridayButton setThingViewByBool:self.fridayButton.haveThing];
    [self.fridayButton clearThingView];

    self.saturdayButton.haveThing=NO;
    [self.saturdayButton setThingViewByBool:self.saturdayButton.haveThing];
    [self.saturdayButton clearThingView];

}



@end
