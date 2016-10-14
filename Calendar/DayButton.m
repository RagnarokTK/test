//
//  DayButton.m
//  Calendar
//
//  Created by tk on 2016/10/13.
//  Copyright © 2016年 tk. All rights reserved.
//

#import "DayButton.h"
@implementation DayButton

-(instancetype)init{
    self=[super init];
    return self;

}

-(void)setThingViewByBool:(Boolean) haveOrNo{
    if (haveOrNo == YES) {
        if (self.thingView==nil)
        self.thingView=[[UIView alloc]init];
        self.thingView.frame=CGRectMake(self.titleLabel.center.x-2, self.titleLabel.center.y+15, 5, 5);
        [self.thingView.layer setCornerRadius:2.5];
        self.thingView.backgroundColor=[UIColor blueColor];
        [self addSubview:self.thingView];
    }
    else{
        if (self.thingView!=nil) {
         
        [self.thingView removeFromSuperview];
        }
    
    }
}

-(void)clearThingView{
    
    if (self.thingView!=nil) {
        
        [self.thingView removeFromSuperview];
    }
    
    
}
@end
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

