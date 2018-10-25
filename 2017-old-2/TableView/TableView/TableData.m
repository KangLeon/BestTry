//
//  TableData.m
//  TableView
//
//  Created by jitengjiao      on 2017/9/7.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "TableData.h"

@implementation TableData

+(instancetype)sharedTableData{

    static TableData* tableData=nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tableData=[[self alloc] init];
    });
    
    return tableData;
}

-(instancetype)init{

    self=[super init];
    NSString *path=[[NSBundle mainBundle] pathForResource:@"ProvincesAndCities" ofType:@"plist"];
    
    NSArray *chinaArray=[NSArray arrayWithContentsOfFile:path];
    
    self.chinaArr=chinaArray;
    
    return self;
}

@end
