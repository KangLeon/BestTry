//
//  ViewController.m
//  TableView
//
//  Created by jitengjiao      on 2017/9/7.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"
#import "TableData.h"
#import "CityListTableViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;//拖动的输出口
@property(strong,nonatomic)TableData *tableData;//自定义model类

@end

@implementation ViewController

//这里是可拓展需求，想起来新的需求就添加上来
//可以接下来选择 1.交换两个索引，删除，
//            2.打开地图标注出来，
//            3.显示一个WebView显示该地的百度百科，
//            4.搜索栏与索引条，

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadFile];//如果想加载指定文件下的文件的话，则带参
    self.navigationItem.title=@"全国各省列表";
    
}

-(void)loadFile{
    
    _tableData=[TableData sharedTableData];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tableData.chinaArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    
    NSDictionary *dic=[_tableData.chinaArr objectAtIndex:indexPath.row];
    
    NSString *name=[dic objectForKey:@"State"];
    
    cell.textLabel.text=name;
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSIndexPath *indexPath=[self.tableView indexPathForCell:sender];//可以获得当前行索引
    CityListTableViewController *cityList=segue.destinationViewController;
    
    NSDictionary *dic=[_tableData.chinaArr objectAtIndex:indexPath.row];
    
    NSString *name=[dic objectForKey:@"State"];
    
    cityList.navigationItem.title=name;
    
    cityList.cityDictionary=dic;
    
}
//选择专场方式而不是navigation的推入方式的话，所以底下的值都传不过去的
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    CityListTableViewController *cityVC=[[CityListTableViewController alloc] init];
//    
//    NSDictionary *dic=[_tableData.chinaArr objectAtIndex:indexPath.row];
//    
//    cityVC.cityDictionary=dic;
//
//}



 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }




 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 


 

@end

