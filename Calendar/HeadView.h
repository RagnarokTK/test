//
//  HeadView.h
//  Calendar
//
//  Created by tk on 16/10/9.
//  Copyright © 2016年 tk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LastMonthBlock)();
typedef void (^NextMonthBlock)();

@interface HeadView : UIView
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) LastMonthBlock lastMonthBlock;
@property (strong, nonatomic) NextMonthBlock nextMonthBlock;

+ (instancetype)headViewFromNib;

-(void)setDateLabelText:(NSString *)str;
-(void)setDateLabel:(UILabel *)dateLabel;
- (IBAction)LastMonth:(id)sender;
- (IBAction)NextMonth:(id)sender;
@end
