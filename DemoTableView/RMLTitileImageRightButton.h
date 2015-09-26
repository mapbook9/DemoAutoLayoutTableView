//
//  UMTitileImageRightButton.h
//  TCB
//
//  Created by Umatrix on 11/27/13.
//  Copyright (c) 2013 umatrix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface RMLTitileImageRightButton :UIButton
{
    UILabel *lblLeftTitle;
    UIImageView *imageViewRight;
}

-(void)initWithTitleImageRight:(NSString *)titleLeft font:(UIFont *)_fontTitleLeft colorTitleLeft:(UIColor *)colorTitleLeft ImageRight:(UIImage *) imageRight;
-(void)setTitleLeftText:(NSString *)title;
-(void)setFontSizeOfText:(float)pFontSize;
//Set text alignment left view
-(void)formatTextAlignmentLeft;
//Set hiden title button 
-(void)hidenLableTitle:(BOOL)isHiden;
-(void)setBackGroundColorFotTitle:(UIColor *)color;
-(void)SetValueIconRightOfButton:(UIImage *) pIconRight;
@end
