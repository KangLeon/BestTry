//
//  CityListTableViewController.h
//  TableView
//
//  Created by jitengjiao      on 2017/9/7.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityListTableViewController : UITableViewController

@property(copy,nonatomic)NSDictionary *cityDictionary;
@property(strong,nonatomic)NSNumber *numberlati;
@property(strong,nonatomic)NSNumber *numberlongi;


@end
