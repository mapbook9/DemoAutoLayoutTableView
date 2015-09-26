//
//  RMLHotelListTableViewCell.h
//  StarHub
//
//  Created by Hien Tran on 6/30/15.
//  Copyright (c) 2015 Apps Rainmakerlabs. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "BaseListTableViewCell.h"
@interface ItemListGuideCell: UITableViewCell //BaseListTableViewCell
@property (weak, nonatomic) IBOutlet UIView *vwContainInfo;
/*! @Hien This property knows UIImageView logo item of list. */
@property (weak, nonatomic) IBOutlet UIImageView *imvLogo;
/*! @Hien This property knows lable title item of list. */
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
/*! @Hien This property knows index of cell in list. */
@property (nonatomic) NSInteger indexCell;

@property (nonatomic) IBOutlet UIWebView *webView;
@end
