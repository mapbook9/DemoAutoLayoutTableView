//
//  PoliciesTableViewCell.m
//  StarHub
//
//  Created by Hien Tran on 7/4/15.
//  Copyright (c) 2015 Apps Rainmakerlabs. All rights reserved.
//

#import "WesayTableViewCell.h"

@implementation WesayTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.btnSeeMore initWithTitleImageRight:@"See more" font:[UIFont fontWithName:@"Helvetica" size:12] colorTitleLeft:[UIColor blackColor] ImageRight:[UIImage imageNamed:@"ic_open"]];
    self.btnSeeMore.layer.cornerRadius = 4;
    self.btnSeeMore.layer.borderWidth = 1;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        //        [self loadViews];
        //        [self constrainViews];
    }
    return self;
}

//Button See more touch up inside
-(IBAction)buttonSeemoreTouchUpInside:(id)sender {
    if ([self.delegate respondsToSelector:@selector(buttonSeeMoreTouchUpInside:)]) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
        [self.delegate buttonSeeMoreTouchUpInside:indexPath];
    }
}

- (void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
    
    self.contentView.frame = self.bounds;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView updateConstraintsIfNeeded];
    [self.contentView layoutIfNeeded];
    self.lblInfo.preferredMaxLayoutWidth = CGRectGetWidth(self.lblInfo.frame);
    
    //Set conner radius for contain view inf
}

@end
