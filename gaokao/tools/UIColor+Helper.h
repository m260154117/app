//
//  UIColor+Helper.h
//  ContactWorks
//
//  Created by qh on 15/5/19.
//  Copyright (c) 2015年 Beijing ZincTech. All rights reserved.
//

#import <Foundation/Foundation.h>

#define C_RGB_A(COLORSTR,ALPHA) ([UIColor colorWithRGB:(COLORSTR) alpha:(ALPHA)])
#define C_RGB(COLORSTR) C_RGB_A((COLORSTR),1)
#define C_R_G_B_A(r,g,b,a) ([UIColor colorWithIntRed:r green:g blue:b alpha:a])
#define C_R_G_B(r,g,b) C_R_G_B_A(r,g,b,1)

#define DEFAULT_BACKGROUND_COLOR C_RGB(0x00000000)
#define DEFAULE_TITLE_FONT_COLOR [UIColor blackColor]

#define MAIN_TEXT_COLOR C_RGB(0x727171)
#define SECOND_TEXT_COLOR C_RGB(0xa4a4a4)



#define HIGHT_LIGHT_COLOR C_RGB(0xff630d)
#define MAIN_ORANGE_COLOR HIGHT_LIGHT_COLOR
#define MAIN_GREEN_COLOR C_RGB(0x3CC7AE)

@interface UIColor (Helper)

// for exmaple UIColor *color = [UIColor colorWithRGB:0xff0000 alpha:0.5];
+ (UIColor*)colorWithRGB:(unsigned int)aRGB alpha:(CGFloat)aAlpha;

+ (UIColor *)colorWithIntRed:(uint)red green:(uint)green blue:(uint)blue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithARGB:(unsigned int)argb;
+ (UIColor *)colorWithRGB:(unsigned int)rgb;

+ (UIColor *)colorWithRGBHexString:(NSString *)hex;
+ (UIColor *)colorWithARGBHexString:(NSString *)hex;

- (NSString *)hexARGBString;
- (NSString *)hexRGBString;
- (BOOL)isGrayLikeColor;

+(UIColor *)colorWithHex:(int)hex;


@end
