//
//  customCell.h
//  gaokao
//
//  Created by MiaoLizhuang on 15/11/21.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customCell : UITableViewCell{
    UILabel * _yearLabel;
    UILabel *_piciLabel1;
    UILabel * _wenkeLabel1;
    UILabel * _likeLabel1;
    UILabel *_piciLabel2;
    UILabel * _wenkeLabel2;
    UILabel * _likeLabel2;
    UILabel *_piciLabel3;
    UILabel * _wenkeLabel3;
    UILabel * _likeLabel3;
}
-(void)reloadCellWithArray:(NSDictionary*)info;
@end
