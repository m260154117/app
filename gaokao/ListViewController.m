//
//  ListViewController.m
//  大学录取分数
//
//  Created by MiaoLizhuang on 15/12/16.
//  Copyright © 2015年 MiaoLizhuang. All rights reserved.
//

#import "ListViewController.h"
#import "LZSlider.h"
@interface ListViewController ()<LZSliderDelegate,UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
}

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureUI];
}
-(void)configureUI{
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.width,KScreenHeight-64)];
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    
      }

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
  
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)LZSliderValue:(float)value{
    NSLog(@"%f",value);
}
@end
