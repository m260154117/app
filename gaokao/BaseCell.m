//
//  BaseCell.m
//  大学录取分数
//
//  Created by MiaoLizhuang on 15/12/16.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configureUI];
    }
    return self;
}

-(void)configureUI{
    
    
}
-(void)reloadCellWithArray:(NSDictionary*)info{
  
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
