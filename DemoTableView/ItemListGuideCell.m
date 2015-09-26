//
//  RMLHotelListTableViewCell.m
//  StarHub
//
//  Created by Hien Tran on 6/30/15.
//  Copyright (c) 2015 Apps Rainmakerlabs. All rights reserved.
//

#import "ItemListGuideCell.h"
@implementation ItemListGuideCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.contentView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.contentView updateConstraintsIfNeeded];
    //This line very important to reupdate layout
    //[self.contentView layoutIfNeeded];
    
    //self.lblTitle.preferredMaxLayoutWidth = CGRectGetWidth(self.lblTitle.frame);
    
    //Set conner radius for image logo
    //Format border for view below image of item tour
    self.imvLogo.clipsToBounds = YES;
    //Set conner radius for image logo
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.imvLogo.bounds byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight) cornerRadii:CGSizeMake(10.0, 10.0)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.imvLogo.bounds;
    maskLayer.path = maskPath.CGPath;
    self.imvLogo.layer.mask = maskLayer;
    
    //
    //    //    //Set conner radius for contain view info
    UIBezierPath *maskPathContainInfo = [UIBezierPath bezierPathWithRoundedRect:self.vwContainInfo.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(10.0, 10.0)];
    CAShapeLayer *maskLayerContainInfo = [[CAShapeLayer alloc] init];
    maskLayerContainInfo.frame = self.vwContainInfo.bounds;
    maskLayerContainInfo.path = maskPathContainInfo.CGPath;
    self.vwContainInfo.layer.mask = maskLayerContainInfo;
}

- (void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
    
    self.contentView.frame = self.bounds;
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
