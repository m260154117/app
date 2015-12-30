//
//  LZSlider.h
//  大学录取分数
//
//  Created by MiaoLizhuang on 15/12/16.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LZSliderDelegate <NSObject>

-(void)LZSliderValue:(float)value;

@end
@interface LZSlider : UIView
{
    UISlider * _slider;
    UILabel * _label;
}
@property (nonatomic,strong) id<LZSliderDelegate>delegate;
-(id)initWithFrame:(CGRect)frame AndCurrentValue:(float)currentValue AndMaxValue:(float)maxValue AndMinValue:(float)minValue;

@end
