//
//  ViewController.m
//  UITableView
//
//  Created by jitengjiao      on 2017/10/20.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 20,[UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height)];
    
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height)];
    
    imageView.image=[UIImage imageNamed:@"zx.jpg"];
    imageView.contentMode=UIViewContentModeScaleAspectFill;
    _tableView.backgroundView=imageView;
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    cell.textLabel.text=@"nihao";
    cell.backgroundColor=[UIColor clearColor];//清除颜色
    return  cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
