//
//  DetailViewCell.h
//  Calendar
//
//  Created by tk on 16/10/10.
//  Copyright © 2016年 tk. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SetAddButtonBlock)();

@interface DetailViewCell : UITableViewCell
@property(nonatomic, strong) IBOutlet UILabel *detailLabel;
@property(nonatomic, strong) SetAddButtonBlock setAddButtonBlock;
@end
