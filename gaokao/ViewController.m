//
//  ViewController.m
//  gaokao
//
//  Created by MiaoLizhuang on 15/11/21.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import "ViewController.h"
#import "ZHPickView.h"
#import "RatingBar.h"
#define rowHeight 120
#define rowNumber 1
#define headerHeight 50


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,ZHPickViewDelegate,RatingBarDelegate>{
    NSDictionary * _infoDictionary;
}
@property(nonatomic,strong)ZHPickView *pickview;
@property (nonatomic,strong) NSString * city;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UILabel * clickLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self prepareData];
    [self configureUI];
}
-(void)prepareData{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"gaokao" ofType:@"plist"];
     _infoDictionary= [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"_infoDictionary%@",_infoDictionary);
}
-(void)configureUI{
    self.city = @"";
    [self.navigationController.navigationBar setTitleTextAttributes:
  @{
    NSFontAttributeName:[UIFont systemFontOfSize:20],
    NSForegroundColorAttributeName:[UIColor whiteColor]
    }];
    
    self.clickLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, 40)];
    self.clickLabel.backgroundColor = [UIColor whiteColor];
    self.clickLabel.text = @"点击选择省份";
    self.clickLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.clickLabel];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    self.clickLabel.userInteractionEnabled = YES;
    [self.clickLabel addGestureRecognizer:tap];
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.clickLabel.bottom, self.view.frame.size.width, self.view.frame.size.height-64-40) style:UITableViewStylePlain ];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:self.tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.city isEqualToString:@""]) {
        return 0;
    }else{
        return [_infoDictionary[self.city] count];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return rowHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
   
    return headerHeight;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
   
    UIView *view = [[UIView alloc]init];
    
    view.backgroundColor = [UIColor whiteColor];
    view.frame = CGRectMake(0, 0, self.view.frame.size.width, headerHeight);
    
    UILabel * upLine = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 1.0)];
    upLine.backgroundColor = kBlueColor;
    [view addSubview:upLine];
    
    UILabel * yearLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, upLine.bottom, (KScreenWidth-3.0)/4.0, headerHeight-1)];
    yearLabel.backgroundColor = [UIColor clearColor];
    yearLabel.text = @"年份";
    yearLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:yearLabel];
    
    UILabel * sepLabe = [[UILabel alloc]initWithFrame:CGRectMake(yearLabel.right, 1, 1, headerHeight-1)];
    sepLabe.backgroundColor =kBlueColor;
    [view addSubview:sepLabe];
    
    UILabel * piciLabel = [[UILabel alloc]initWithFrame:CGRectMake(sepLabe.right, upLine.bottom, (KScreenWidth-3.0)/4.0, headerHeight-1)];
    piciLabel.backgroundColor = [UIColor clearColor];
    piciLabel.text = @"录取线";
    piciLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:piciLabel];
    
    UILabel * sepLabel = [[UILabel alloc]initWithFrame:CGRectMake(piciLabel.right, 1, 1, headerHeight-1)];
    sepLabel.backgroundColor =kBlueColor;
    [view addSubview:sepLabel];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(sepLabel.right, upLine.bottom, (self.view.frame.size.width-3.0)/4.0, headerHeight-1)];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"理科";
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    
    UILabel * sepLabel1 = [[UILabel alloc]initWithFrame:CGRectMake(label.right, 1, 1, headerHeight-2)];
    sepLabel1.backgroundColor =kBlueColor;
    [view addSubview:sepLabel1];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(sepLabel1.right, 0, (self.view.frame.size.width-3.0)/4.0, headerHeight-1)];
    label1.backgroundColor = [UIColor clearColor];
    label1.text = @"文科";
    label1.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label1];
    
    UILabel * downLine = [[UILabel alloc]initWithFrame:CGRectMake(0, label1.bottom, KScreenWidth, 1.0)];
    downLine.backgroundColor = kBlueColor;
    [view addSubview:downLine];
    
    return view;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   static NSString * cellId = @"cellId";
    customCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[customCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }

    [cell reloadCellWithArray:[_infoDictionary[self.city] objectAtIndex:indexPath.row]];
    
    return cell;
    
}

-(void)tapClick:(UITapGestureRecognizer*)tap{
    NSLog(@"选择城市");
    _pickview=[[ZHPickView alloc] initPickviewWithArray:_infoDictionary.allKeys isHaveNavControler:NO];
    _pickview.backgroundColor = kDefaultBgColor;
    _pickview.delegate=self;
    [_pickview show];
}
-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    self.city = resultString;
    self.clickLabel.text = self.city;
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)ratingChanged:(float)newRating{
    NSLog(@"%f",newRating);
}

@end
