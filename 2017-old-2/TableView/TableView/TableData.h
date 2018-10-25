//
//  TableData.h
//  TableView
//
//  Created by jitengjiao      on 2017/9/7.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableData : NSObject

@property(nonatomic,copy)NSArray *chinaArr;
@property(nonatomic,copy)NSDictionary *proviceDic;
@property(nonatomic,copy)NSArray *citiesArr;
@property(nonatomic,copy)NSDictionary *cityDic;

+(instancetype)sharedTableData;

@end
