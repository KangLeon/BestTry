//
//  ViewController.m
//  1UITableView
//
//  Created by Jones on 10/7/16.
//  Copyright © 2016 Jones. All rights reserved.
//
// 1 UITableView = 表格＋视图
// 2 UITableView cell N行单列
// 3 滚动 ：UIScrollView

// 1 数据加载 2 UITableView 3 数据展示 MVC
#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray *saintArray;
    UITableView *tableView;
    NSMutableArray *indexArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1 path 2 加载文件
    NSString *path = [[NSBundle mainBundle]pathForResource:@"saint.plist" ofType:nil];
    saintArray = [NSArray arrayWithContentsOfFile:path];
    
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, 414, 600)];
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    indexArray = [[NSMutableArray alloc]init];
    for (NSDictionary *item in saintArray) {
        NSString *name = [item valueForKey:@"name"];
        [indexArray addObject:name];
    }
}
// 右侧索引条
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return indexArray;
}
// 索引条 响应方法
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index{
    NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
    // 滚动到当前 index位置
    [tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:true];
    // 拿到当前cell
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:path];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    return index;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return saintArray.count;
}
// 使用cell 检查缓存cell 有 cell 没有new
// 1 性能 2 面试
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellID = @"www.imooc.com.tb";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        NSLog(@"当前cell不可用 %ld",(long)indexPath.row);
    }
    
    NSDictionary *dic = [saintArray objectAtIndex:indexPath.row];
    NSString *name = [dic valueForKey:@"name"];
    NSString *image = [dic valueForKey:@"image"];
    NSString *detail = [dic valueForKey:@"detail"];
    
    cell.textLabel.text = name;
    cell.imageView.image = [UIImage imageNamed:image];
    cell.detailTextLabel.text = detail;
    
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.detailTextLabel.numberOfLines = 0;
    return cell;
    
}
// cell 指定的高度为100
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic = [saintArray objectAtIndex:indexPath.row];
    NSString *detail = [dic valueForKey:@"detail"];
    CGSize size = [self sizeWithText:detail font:[UIFont systemFontOfSize:10.0] maxSize:CGSizeMake(300, MAXFLOAT)];
    return size.height+44;
}
// 根据当前的字符串 获取 宽高,这个方法很经典，建议封装成一个工具类，
-(CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *fontDic = @{NSFontAttributeName:font};
    CGSize size;
    // 通过当前的字符串 获取其宽高
    size = [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:fontDic context:nil].size;
    
    return size;
}
@end
