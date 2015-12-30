//
//  LZSlider.m
//  大学录取分数
//
//  Created by MiaoLizhuang on 15/12/16.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import "LZSlider.h"
#define space  10
#define showLabelWidth 30
#define sliderHeigh 20
@implementation LZSlider

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame AndCurrentValue:(float)currentValue AndMaxValue:(float)maxValue AndMinValue:(float)minValue{
    
    if (self = [super initWithFrame:frame]) {
        [self configureUIWithMaxValue:maxValue AndMinValue:minValue AndCurrentValue:currentValue];
    }
    return self;
}


-(void)configureUIWithMaxValue:(float)maxValue AndMinValue:(float)minValue AndCurrentValue:(float)currentValue{
    
    _slider = [[UISlider alloc]initWithFrame:CGRectMake(0, (self.frame.size.height-sliderHeigh)/2.0, self.width-space-showLabelWidth, sliderHeigh)];
    _slider.minimumValue = minValue;
    _slider.maximumValue = maxValue;
    _slider.value = currentValue;
    [_slider addTarget:self action:@selector(sliderActions) forControlEvents:UIControlEventValueChanged];
    [self addSubview:_slider];
    
    _label = [[UILabel alloc]initWithFrame:CGRectMake(_slider.right+5 , _slider.origin.y, showLabelWidth, sliderHeigh)];
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:13.0];
    _label.text = [NSString stringWithFormat:@"%.1f",_slider.value];
    [self addSubview:_label];
}

-(void)sliderActions{
    _label.text = [NSString stringWithFormat:@"%.1f",_slider.value];
    if ([self.delegate respondsToSelector:@selector(LZSliderValue:)]) {
        [self.delegate LZSliderValue:_slider.value];
    }
}
@end
