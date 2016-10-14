//
//  DetailViewCell.m
//  Calendar
//
//  Created by tk on 16/10/10.
//  Copyright © 2016年 tk. All rights reserved.
//

#import "DetailViewCell.h"

@implementation DetailViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)addButtonClick:(id)sender {
    
    if (self.setAddButtonBlock) {
        self.setAddButtonBlock();
    }
}

@end
