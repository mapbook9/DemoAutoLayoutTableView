//
//  PoliciesTableViewCell.h
//  StarHub
//
//  Created by Hien Tran on 7/4/15.
//  Copyright (c) 2015 Apps Rainmakerlabs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMLTitileImageRightButton.h"

@protocol WesayTableCellDelegate <NSObject>
-(void)buttonSeeMoreTouchUpInside:(NSIndexPath *) rowIndex;
@end
@interface WesayTableViewCell : UITableViewCell
/*! @Hien This property knows lable show contain of text info. */
@property (weak, nonatomic) IBOutlet UILabel* lblInfo;
/*! @Hien This property knows lable title for cell. */
@property (weak, nonatomic) IBOutlet UILabel *lblTitleCell;
/*! @Hien This property knows button see more text in cell */
@property (weak, nonatomic) IBOutlet RMLTitileImageRightButton *btnSeeMore;
@property (weak, nonatomic) id<WesayTableCellDelegate> delegate;
@end
