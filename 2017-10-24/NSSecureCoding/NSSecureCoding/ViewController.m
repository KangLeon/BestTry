//
//  ViewController.m
//  NSSecureCoding
//
//  Created by jitengjiao      on 2017/10/24.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"
#import "MyDog.h"

#import "NSKeyedArchiver+ConvertNSData.h"
#import "NSKeyedUnarchiver+ConvertNSData.h"

@interface ViewController ()

@property(nonatomic,strong)NSData *archivedData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)archeiveObject:(UIButton *)sender {
    //MyDog->NSData
//    NSMutableData *data=[NSMutableData data];
//    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
//    //设置安全加密
//    [archiver setRequiresSecureCoding:YES];
    
    //开始编码
    MyDog *mydog=[[MyDog alloc] init];
    mydog.name=@"泰迪";
    mydog.age=2;
    
    _archivedData=[NSKeyedArchiver dataWithCustomClass:mydog];
    
//    [archiver encodeObject:mydog forKey:NSKeyedArchiveRootObjectKey];
    
//    //结束编码
//    [archiver finishEncoding];
//
//    _archivedData=[data copy];
}
- (IBAction)unArchiveObject:(UIButton *)sender {
    //NSdata->MyDog
//    NSKeyedUnarchiver *unArchiver=[[NSKeyedUnarchiver alloc] initForReadingWithData:_archivedData];
//    //设置安全编码
//    MyDog *dog=[unArchiver decodeObjectOfClass:[MyDog class] forKey:NSKeyedArchiveRootObjectKey];
//    NSLog(@"%@ %ld",dog.name,(long)dog.age);
    MyDog *dog=(MyDog*)[NSKeyedUnarchiver customInstanceFromData:_archivedData ForClass:[MyDog class]];
    NSLog(@"%@ %ld",dog.name,(long)dog.age);
}


@end
