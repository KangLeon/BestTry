//
//  ViewController.m
//  UserDefault
//
//  Created by jitengjiao      on 2017/10/24.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (IBAction)addPreference:(UIButton *)sender {
    
    //增加偏好设置
    //获取NSUSerDefault类实例
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    
    //存储数字类型
    [userDefault setBool:NO forKey:@"BoolKey"];
    [userDefault setInteger:123 forKey:@"IntegerKey"];
    [userDefault setFloat:0.123 forKey:@"FloatKey"];
    [userDefault setDouble:0.123456 forKey:@"DoubleKey"];
    
    //存储字符串类型
    [userDefault setObject:@"Hello" forKey:@"StringKey"];
    
    //存储NSData类型
    NSData *data=[@"hello data" dataUsingEncoding:NSUTF8StringEncoding];
    [userDefault setObject:data forKey:@"DataKey"];
    
    //存储数组类型
    NSArray *array=@[@"one",@"two",@"three"];
    [userDefault setObject:array forKey:@"ArrayKey"];
    
    NSDictionary *dict=@{@"key1":@"value1",@"key2":@"value2",@"key3":@"value3"};
    [userDefault setObject:dict forKey:@"DcitionaryKey"];
    
    [userDefault synchronize];//将存储的偏好存储同步到ROM中
}
- (IBAction)readPreference:(UIButton *)sender {
    //获取userDefault实例
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    
    //读取数字类型
    BOOL readmybool=[userDefault boolForKey:@"BoolKey"];
    NSLog(@"Bool Value is:%@",readmybool?@"true":@"false");
    NSInteger readinteger=[userDefault integerForKey:@"IntegerKey"];
    NSLog(@"Integer Value is:%ld",(long)readinteger);
    float readFloat=[userDefault floatForKey:@"FloatKey"];
    NSLog(@"Float Value is:%f",readFloat);
    double readDouble=[userDefault doubleForKey:@"DoubleKey"];
    NSLog(@"Double Value is:%lf",readDouble);
    
    
    //读取字符串类型
    NSString *readString=[userDefault stringForKey:@"StringKey"];
    NSLog(@"String Value is:%@",readString);
    //读取NSData类型
    NSData *readData=[userDefault dataForKey:@"DataKey"];
    NSString *dataString=[[NSString alloc] initWithData:readData encoding:NSUTF8StringEncoding];
    NSLog(@"Data Value is:%@",dataString);
    //读取数组类型
    NSArray *readArray=[userDefault arrayForKey:@"ArrayKey"];
    NSLog(@"Arrar Value is:%@",readArray);
    NSDictionary *readDict=[userDefault dictionaryForKey:@"DcitionaryKey"];
    NSLog(@"Dictionary value is:%@",readDict);
}
- (IBAction)modifyPreference:(UIButton *)sender {
    //增加偏好设置
    //获取NSUSerDefault类实例
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    
    //存储数字类型
    [userDefault setBool:YES forKey:@"BoolKey"];
    [userDefault setInteger:456 forKey:@"IntegerKey"];
    [userDefault setFloat:0.456 forKey:@"FloatKey"];
    [userDefault setDouble:0.456789 forKey:@"DoubleKey"];
    
    //存储字符串类型
    [userDefault setObject:@"world" forKey:@"StringKey"];
    
    //存储NSData类型
    NSData *data=[@"data world" dataUsingEncoding:NSUTF8StringEncoding];
    [userDefault setObject:data forKey:@"DataKey"];
    
    //存储数组类型
    NSArray *array=@[@"one",@"two",@"three"];
    [userDefault setObject:array forKey:@"ArrayKey"];
    
    NSDictionary *dict=@{@"key1":@"value1",@"key2":@"value2",@"key3":@"value3"};
    [userDefault setObject:dict forKey:@"DcitionaryKey"];
    
    [userDefault synchronize];//将存储的偏好存储同步到ROM中
}
- (IBAction)deletePreference:(UIButton *)sender {
    NSUserDefaults *userDefault=[NSUserDefaults standardUserDefaults];
    [userDefault removeObjectForKey:@"BoolKey"];
    [userDefault removeObjectForKey:@"IntegerKey"];
    [userDefault removeObjectForKey:@"FloatKey"];
    [userDefault removeObjectForKey:@"DoubleKey"];
    
    [userDefault removeObjectForKey:@"StringKey"];
    [userDefault removeObjectForKey:@"DataKey"];
    
    [userDefault removeObjectForKey:@"ArrayKey"];
    [userDefault removeObjectForKey:@"DcitionaryKey"];
}
- (IBAction)clearAllPreference:(UIButton *)sender {
    //删除所有偏好存储
    NSString *appDomainString=[[NSBundle mainBundle] bundleIdentifier];//获取应用的域的字符串
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomainString];//清空偏好存储
}

@end
