//
//  UMTitileImageRightButton.m
//  TCB
//
//  Created by Umatrix on 11/27/13.
//  Copyright (c) 2013 umatrix. All rights reserved.
//

#import "RMLTitileImageRightButton.h"
#define FONT_OPENSANS_REGULAR @"OpenSans-Regular"

@implementation RMLTitileImageRightButton
-(void)initWithTitleImageRight:(NSString *)titleLeft font:(UIFont *)_fontTitleLeft colorTitleLeft:(UIColor *)colorTitleLeft ImageRight:(UIImage *) imageRight
{
    if (!lblLeftTitle) lblLeftTitle = [[UILabel alloc] init];
    
    if(!imageViewRight)
    {
        imageViewRight = [[UIImageView alloc] init];
    }
    
    lblLeftTitle.text =titleLeft;
    
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_6_0
    buttonLabel1.textAlignment = NSTextAlignmentLeft;
#else
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
    lblLeftTitle.textAlignment = UITextAlignmentLeft;
#pragma clang diagnostic pop
    
#endif
    lblLeftTitle.backgroundColor = [UIColor clearColor];

    CGRect titleRect1 = CGRectMake(0
                                   ,0
                                   ,self.frame.size.width  - imageRight.size.width - 7
                                   ,self.frame.size.height );
    CGRect imageRect = CGRectMake(self.frame.size.width - imageRight.size.width - 7,(self.frame.size.height - imageRight.size.height)/2 , imageRight.size.width, imageRight.size.height);
    
    lblLeftTitle.frame = titleRect1;
    
    imageViewRight.frame = imageRect;
    
    [imageViewRight setImage:imageRight];
    lblLeftTitle.font = [UIFont fontWithName:FONT_OPENSANS_REGULAR size: 15];
    if(_fontTitleLeft)
    {
         lblLeftTitle.font = _fontTitleLeft;
    }
   
    lblLeftTitle.textColor = colorTitleLeft;
    lblLeftTitle.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lblLeftTitle];

    [self addSubview:imageViewRight];
    
    [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
}
-(void)setTitleLeftText:(NSString *)title
{
    [lblLeftTitle setText:title];
}
-(void)setFontSizeOfText:(float)pFontSize {
    lblLeftTitle.font = [UIFont systemFontOfSize:pFontSize];
}
-(void)hidenLableTitle:(BOOL)isHiden {
    [lblLeftTitle setHidden:isHiden];
}
-(void)formatTextAlignmentLeft
{
    lblLeftTitle.textAlignment = NSTextAlignmentLeft;
}
-(void)setBackGroundColorFotTitle:(UIColor *)color {
    [lblLeftTitle setBackgroundColor:color];
}

-(void)SetValueIconRightOfButton:(UIImage *) pIconRight {
    [imageViewRight setImage:pIconRight];
}
@end
