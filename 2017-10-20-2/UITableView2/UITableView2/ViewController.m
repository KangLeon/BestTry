//
//  ViewController.m
//  UITableView2
//
//  Created by jitengjiao      on 2017/10/20.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *saintArray;
@property(nonatomic,strong) UITableView *tableView;

- (IBAction)reloadAllData:(UIButton *)sender;
- (IBAction)loadOneData:(UIButton *)sender;
- (IBAction)editData:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *path=[[NSBundle mainBundle] pathForResource:@"saint" ofType:@"plist"];
    _saintArray=[[NSMutableArray alloc] initWithArray:[NSArray arrayWithContentsOfFile:path]];
    

    _tableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width,  [UIScreen mainScreen].bounds.size.height)];
    
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self.view addSubview:_tableView];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _saintArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *otherArray=[_saintArray objectAtIndex:section];
    return otherArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"mycell"];
    }
    
    NSArray *otherArray=[_saintArray objectAtIndex:indexPath.section];
    NSDictionary *dic=[otherArray objectAtIndex:indexPath.row];
    NSString *name=[dic objectForKey:@"name"];
//    NSString *image=[dic objectForKey:@"image"];
    NSString *detail=[dic objectForKey:@"detail"];
    
    cell.textLabel.text=name;
    cell.imageView.image=[UIImage imageNamed:@"zx2.png"];
    cell.detailTextLabel.text=detail;
    
    cell.detailTextLabel.textColor=[UIColor grayColor];
    
    //设置背景第一种方法：UIImageView
//    UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.png"]];
//    cell.backgroundView=imageView;
    
    
    //设置背景的第二种方法：UIView
//    UIView *view=[[UIView alloc] init];
//    view.backgroundColor=[UIColor yellowColor];
//    cell.backgroundView=view;
    
    //设置背景的第三种方法：backgroundColor
//    cell.backgroundColor=[UIColor yellowColor];
    
    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//        UIView *view=[[UIView alloc] init];
//        view.backgroundColor=[UIColor yellowColor];
//    return view;
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//        UIView *view=[[UIView alloc] init];
//        view.backgroundColor=[UIColor greenColor];
//    return view;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 40;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if(section==0){
        return @"雅典娜组";
    }else{
        return @"教皇组";
    }
    
}

-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if(section==0){
        return @"战斗力：800-1000";
    }else if (section==1){
        return @"战斗力：650-900";
    }else{
        return @"战5渣";
    }
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//刷新所有数据
- (IBAction)reloadAllData:(UIButton *)sender {
    NSDictionary *dic1=[[NSDictionary alloc] initWithObjectsAndKeys:@"zx2.jpg",@"image",@"白羊座",@"name",@"修复圣衣",@"detail", nil];
    NSDictionary *dic2=[[NSDictionary alloc] initWithObjectsAndKeys:@"zx2.jpg",@"image",@"金牛座",@"name",@"忠诚",@"detail", nil];
    NSArray *array1=[[NSArray alloc] initWithObjects:dic1, nil];
    NSArray *array2=[[NSArray alloc] initWithObjects:dic2, nil];
    _saintArray=@[array1,array2];
    
    [_tableView reloadData];
    
}

//刷新某一条数据，但是她的心数据在哪里啊？？？
- (IBAction)loadOneData:(UIButton *)sender {
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:0 inSection:0];
    [_tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

//开启编辑
- (IBAction)editData:(UIButton *)sender {
    _tableView.editing=true;
}

//编辑场景
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *dataArray=[_saintArray objectAtIndex:indexPath.section];
    NSMutableArray *dataMutableArray=[[NSMutableArray alloc] initWithArray:dataArray];
    [dataMutableArray removeObjectAtIndex:indexPath.row];
    
    [_saintArray replaceObjectAtIndex:indexPath.section withObject:dataMutableArray];
    [_tableView reloadData];
}

//数据提交 页面跳转
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *dataarray=[_saintArray objectAtIndex:indexPath.section];
    NSDictionary *dic=[dataarray objectAtIndex:indexPath.row];
    NSString *name=[dic objectForKey:@"name"];
    NSString *detail=[dic objectForKey:@"detail"];
    NSLog(@"name:%@  detail:%@",name,detail);
}

@end

