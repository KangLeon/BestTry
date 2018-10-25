//
//  TableViewCell.h
//  UITableView
//
//  Created by jitengjiao      on 2017/10/22.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
+(instancetype)createCellWithTableView:(UITableView *)tableView;
-(void)loadData:(NSString *)image label:(NSString *)label;
@end
