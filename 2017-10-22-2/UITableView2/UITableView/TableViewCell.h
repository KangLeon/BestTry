//
//  TableViewCell.h
//  UITableView
//
//  Created by jitengjiao      on 2017/10/22.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property(nonatomic,assign)BOOL selectedFlag;
+(instancetype)createCellWithTableView:(UITableView *)tableView;
-(void)setCheckStatus:(BOOL)flag;
-(void)setCellText:(NSString *)str;
@end
