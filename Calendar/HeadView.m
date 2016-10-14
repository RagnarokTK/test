//
//  HeadView.m
//  Calendar
//
//  Created by tk on 16/10/9.
//  Copyright © 2016年 tk. All rights reserved.
//

#import "HeadView.h"
#import "DayViewCell.h"
@implementation HeadView


- (void)awakeFromNib {



}
+ (instancetype)headViewFromNib {
 return [[[NSBundle mainBundle] loadNibNamed:@"HeadView" owner:nil options:nil] lastObject];


}

-(void)setDateLabelText:(NSString *)str{

    self.dateLabel.text=str;

}


- (IBAction)LastMonth:(id)sender {
    if (self.lastMonthBlock) {
        self.lastMonthBlock();

    }
    
}
- (IBAction)NextMonth:(id)sender {
    if (self.nextMonthBlock) {
        self.nextMonthBlock();
   
    }

}
@end
