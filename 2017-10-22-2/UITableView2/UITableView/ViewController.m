//
//  ViewController.m
//  UITableView
//
//  Created by jitengjiao      on 2017/10/22.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSArray *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.data=@[@"China",@"Korea",@"America",@"Japan",@"Franch",@"England",@"United_State"];
    self.tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.tableView];
    
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *countryName=[self.data objectAtIndex:indexPath.row];
    TableViewCell *cell=[TableViewCell createCellWithTableView:tableView];
    [cell setCellText:countryName];
    [cell setCheckStatus:false];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    BOOL currentFlag=cell.selectedFlag;
    [cell setCheckStatus:!currentFlag];
    
}


@end
