//
//  customCell.m
//  gaokao
//
//  Created by MiaoLizhuang on 15/11/21.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import "customCell.h"

@implementation customCell



-(void)configureUI{
    
    _yearLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, (KScreenWidth-3.0)/4.0, 120)];
    _yearLabel.backgroundColor = [UIColor clearColor];
    _yearLabel.text = @"--";
    _yearLabel.textColor = kTextLightGray;
    _yearLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_yearLabel];
    
    UILabel * shuLine = [[UILabel alloc]initWithFrame:CGRectMake((KScreenWidth-3.0)/4.0, 0, 1.0, 120-1.0)];
    shuLine.backgroundColor = kBlueColor;
    [self addSubview:shuLine];
    
    _piciLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(_yearLabel.right+1, 0, (KScreenWidth-3.0)/4.0, 40)];
    _piciLabel1.backgroundColor = [UIColor clearColor];
    _piciLabel1.text = @"一批";
    _piciLabel1.textColor = kTextLightGray;
    _piciLabel1.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_piciLabel1];
    
    
    _likeLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(_piciLabel1.right+1, 0, (KScreenWidth-3.0)/4.0, 40)];
    _likeLabel1.backgroundColor = [UIColor clearColor];
    _likeLabel1.text = @"--";
    _likeLabel1.textColor = kTextLightGray;
    _likeLabel1.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_likeLabel1];
    
    
    _wenkeLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(_likeLabel1.right+1, 0, (KScreenWidth-3.0)/4.0, 40)];
    _wenkeLabel1.backgroundColor = [UIColor clearColor];
    _wenkeLabel1.text = @"--";
    _wenkeLabel1.textColor = kTextLightGray;
    _wenkeLabel1.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_wenkeLabel1];
    
    UILabel * sepLine = [[UILabel alloc]initWithFrame:CGRectMake((KScreenWidth-3.0)/4.0, 40-1.0, ((KScreenWidth-3.0)/4.0)*3.0+3.0, 1.0)];
    sepLine.backgroundColor = kBlueColor;
    [self addSubview:sepLine];
    UILabel * shuLine1 = [[UILabel alloc]initWithFrame:CGRectMake(_piciLabel1.right, 0, 1.0, 120-1.0)];
    shuLine1.backgroundColor = kBlueColor;
    [self addSubview:shuLine1];
    
    _piciLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(_yearLabel.right+1, sepLine.bottom, (KScreenWidth-3.0)/4.0, 40)];
    _piciLabel2.backgroundColor = [UIColor clearColor];
    _piciLabel2.text = @"二批";
    _piciLabel2.textColor = kTextLightGray;
    _piciLabel2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_piciLabel2];
    
    
    _likeLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(_piciLabel2.right+1, sepLine.bottom, (KScreenWidth-3.0)/4.0, 40)];
    _likeLabel2.backgroundColor = [UIColor clearColor];
    _likeLabel2.text = @"--";
    _likeLabel2.textColor = kTextLightGray;
    _likeLabel2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_likeLabel2];
    
    
    _wenkeLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(_likeLabel2.right+1, sepLine.bottom, (KScreenWidth-3.0)/4.0, 40)];
    _wenkeLabel2.backgroundColor = [UIColor clearColor];
    _wenkeLabel2.text = @"--";
    _wenkeLabel2.textColor = kTextLightGray;
    _wenkeLabel2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_wenkeLabel2];
    
    UILabel * sepLine1 = [[UILabel alloc]initWithFrame:CGRectMake((KScreenWidth-3.0)/4.0+1, 80-1.0, ((KScreenWidth-3.0)/4.0)*3.0+3.0, 1.0)];
    sepLine1.backgroundColor = kBlueColor;
    [self addSubview:sepLine1];
    UILabel * shuLine3 = [[UILabel alloc]initWithFrame:CGRectMake(_likeLabel2.right, 0, 1.0, 120-1.0)];
    shuLine3.backgroundColor = kBlueColor;
    [self addSubview:shuLine3];
    
    _piciLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(_yearLabel.right+1, sepLine1.bottom, (KScreenWidth-3.0)/4.0, 40)];
    _piciLabel3.backgroundColor = [UIColor clearColor];
    _piciLabel3.text = @"三批";
    _piciLabel3.textColor = kTextLightGray;
    _piciLabel3.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_piciLabel3];
    
    
    _likeLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(_piciLabel3.right+1, sepLine1.bottom, (KScreenWidth-3.0)/4.0, 40)];
    _likeLabel3.backgroundColor = [UIColor clearColor];
    _likeLabel3.text = @"--";
    _likeLabel3.textColor = kTextLightGray;
    _likeLabel3.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_likeLabel3];
    
    
    _wenkeLabel3 = [[UILabel alloc]initWithFrame:CGRectMake(_likeLabel3.right+1, sepLine1.bottom, (KScreenWidth-3.0)/4.0, 40)];
    _wenkeLabel3.backgroundColor = [UIColor clearColor];
    _wenkeLabel3.text = @"--";
    _wenkeLabel3.textColor = kTextLightGray;
    _wenkeLabel3.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_wenkeLabel3];
    
    UILabel * sepLine2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 120-1.0, KScreenWidth, 1.0)];
    sepLine2.backgroundColor = kBlueColor;
    [self addSubview:sepLine2];

    
    
}
-(void)reloadCellWithArray:(NSDictionary*)info{
//    _piciLabel.text = array[0];
//    _label.text = array[1];
//    _label1.text = array[2];
    _yearLabel.text = info.allKeys[0];
    NSArray * array = info.allValues[0];
    _likeLabel1.text = [array[0] objectForKey:@"one"];
    _likeLabel2.text = [array[0] objectForKey:@"two"];
    _likeLabel3.text = [array[0] objectForKey:@"three"];
    _wenkeLabel1.text = [array[1] objectForKey:@"one"];
    _wenkeLabel2.text = [array[1] objectForKey:@"two"];
    _wenkeLabel3.text = [array[1] objectForKey:@"three"];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
