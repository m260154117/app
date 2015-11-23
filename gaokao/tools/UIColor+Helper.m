//
//  UIColor+Helper.m

//
//  Created by Reejo Samuel on 8/2/13.
//  Copyright (c) 2013 Reejo Samuel | m[at]reejosamuel.com All rights reserved.
//

#import "UIColor+Helper.h"

static inline NSUInteger integerValueFromHex(NSString *s)
{
    int result = 0;
    sscanf([s UTF8String], "%x", &result);
    return result;
}

@implementation UIColor (Helper)

+(UIColor*)colorWithRGB:(unsigned int)aColor alpha:(CGFloat)aAlpha
{
    int r = aColor / 256 / 256;
    int g = aColor / 256 % 256;
    int b = aColor % 256;
    
    //转换为UIColor
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:aAlpha];
}


+ (UIColor *)colorWithIntRed:(uint)red green:(uint)green blue:(uint)blue alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:red / 255.0f green:green / 255.0f blue:blue / 255.0f alpha:alpha];
}

+ (UIColor*)colorWithARGB:(unsigned int)argb;
{
    CGFloat red = (argb>>16)&0xFF;
    CGFloat green = (argb>>8)&0xFF;
    CGFloat blue = argb&0xFF;
    CGFloat alpha = 255;
    
    if (argb > (unsigned int)0xFFFFFF)
    {
        alpha = (argb>>24)&0xFF;
    }
    
    return [UIColor colorWithIntRed:red green:green blue:blue alpha:alpha];
}

+ (UIColor *)colorWithRGB:(unsigned int)rgb;
{
    return [UIColor colorWithARGB:rgb];
}

+ (UIColor *)colorWithRGBHexString:(NSString *)hex
{
    if ([hex hasPrefix:@"#"]) {
        hex = [hex substringFromIndex:1];
    }
    
    if ([hex length]!=6 && [hex length]!=3)
    {
        return nil;
    }
    
    NSUInteger digits = [hex length]/3;
    CGFloat maxValue = (digits==1)?15.0:255.0;
    
    CGFloat red = integerValueFromHex([hex substringWithRange:NSMakeRange(0, digits)])/maxValue;
    CGFloat green = integerValueFromHex([hex substringWithRange:NSMakeRange(digits, digits)])/maxValue;
    CGFloat blue = integerValueFromHex([hex substringWithRange:NSMakeRange(2*digits, digits)])/maxValue;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (UIColor *)colorWithARGBHexString:(NSString *)hex
{
    if ([hex hasPrefix:@"#"]) {
        hex = [hex substringFromIndex:1];
    }
    
    if ([hex length]!=8 && [hex length]!=4)
    {
        return nil;
    }
    
    NSUInteger digits = [hex length]/4;
    CGFloat maxValue = (digits==1)?15.0:255.0;
    
    CGFloat alpha = integerValueFromHex([hex substringWithRange:NSMakeRange(0, digits)])/maxValue;
    CGFloat red = integerValueFromHex([hex substringWithRange:NSMakeRange(digits, digits)])/maxValue;
    CGFloat green = integerValueFromHex([hex substringWithRange:NSMakeRange(2*digits, digits)])/maxValue;
    CGFloat blue = integerValueFromHex([hex substringWithRange:NSMakeRange(3*digits, digits)])/maxValue;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

- (NSString *)hexARGBString
{
    CGFloat r,g,b,a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return [NSString stringWithFormat:@"#%02x%02x%02x%02x",(int)(a*255), (int)(r*255), (int)(g*255), (int)(b*255)];
}

- (NSString *)hexRGBString
{
    CGFloat r,g,b,a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return [NSString stringWithFormat:@"#%02x%02x%02x", (int)(r*255), (int)(g*255), (int)(b*255)];
}

- (BOOL)isGrayLikeColor
{
    CGFloat r,g,b,a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    return r==g && g==b;
}

+(UIColor *)colorWithHex:(int)hex {
    
    int r = (hex >> 16) & 255;
    int g = (hex >> 8) & 255;
    int b = hex & 255;
    
    float rf = (float)r / 255.0f;
    float gf = (float)g / 255.0f;
    float bf = (float)b / 255.0f;
    
    return [UIColor colorWithRed:rf green:gf blue:bf alpha:1.0];
}

@end
