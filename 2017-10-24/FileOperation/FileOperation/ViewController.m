//
//  ViewController.m
//  FileOperation
//
//  Created by jitengjiao      on 2017/10/23.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "ViewController.h"
#import "MCFileManager.h"

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
- (IBAction)printDirectory:(UIButton *)sender {
    //打印主要的路径
    NSString *home=[MCFileManager homeDirectory];
    NSLog(@"沙盒根目录：%@",home);
    NSLog(@"---------------------------------");
    
    NSString *document=[MCFileManager documentsDirectory];
    NSLog(@"document目录：%@",document);
    NSLog(@"---------------------------------");
    
    NSString *library=[MCFileManager libraryDirectory];
    NSLog(@"library目录：%@",library);
        NSLog(@"---------------------------------");
    
    NSString *cache=[MCFileManager cacheDirectory];
    NSLog(@"cache目录：%@",cache);
        NSLog(@"---------------------------------");
    
    NSString *tmp=[MCFileManager tempDirectory];
    NSLog(@"tmp目录：%@",tmp);
    
    
}
- (IBAction)editPth:(UIButton *)sender {
    //路径字符串的拼接与分离
    NSString *cache=[MCFileManager cacheDirectory];
    NSLog(@"cache目录:%@",cache);
    
    //追加路径
    NSString *newDir=[cache stringByAppendingPathComponent:@"newDir"];
    NSLog(@"新的路径：%@",newDir);
    
    //获取某一个目录的父路径
    NSString *fatherDir=[newDir stringByDeletingLastPathComponent];
    NSLog(@"新路径的父路径:%@",fatherDir);
    
    //创建新的文件路径
    NSString *newFile=[cache stringByAppendingPathComponent:@"newFile"];
    NSLog(@"新的文件路径：%@",newFile);
    //追加拓展名
    newFile=[newFile stringByAppendingPathExtension:@"txt"];
    NSLog(@"追加了拓展名:%@",newFile);
    //删除拓展名
    newFile=[newFile stringByDeletingPathExtension];
    NSLog(@"删除拓展名:%@",newFile);
    
    //拆分路径
    NSArray *pathComponentArray=[cache pathComponents];
    NSLog(@"cache路径拆分：%@",pathComponentArray);
    
    //获取路径上最后一个component
    NSString *lastComponent=[cache lastPathComponent];
    NSLog(@"路径最后一个component：%@",lastComponent);
    
}
- (IBAction)pathExist:(UIButton *)sender {
    //文件存在性操作
    //创建文件夹
    NSString *directoryName=@"myDirectory";
    NSString *cachePath=[MCFileManager cacheDirectory];
    BOOL createResult=[MCFileManager createDirectoryInPath:cachePath directoryName:directoryName];
    if (createResult) {
        NSLog(@"创建文件夹%@成功",directoryName);
    }else{
        NSLog(@"创建文件夹%@失败",directoryName);
    }
    
    
    //创建文件
    NSString *fileName=@"myFile";
    createResult=[MCFileManager createFileInPath:cachePath fileName:fileName];
    if (createResult) {
        NSLog(@"创建文件夹%@成功",directoryName);
    }else{
        NSLog(@"创建文件夹%@失败",directoryName);
    }
    
    //查询文件是否存在
    BOOL isDirectory;
    NSString *filePath=[cachePath stringByAppendingPathComponent:fileName];
    BOOL fileExist=[MCFileManager fileExistInPath:filePath isDirectory:&isDirectory];
    NSLog(@"文件是否存在：%@  是否是文件夹：%@",fileExist?@"是":@"否",isDirectory?@"是":@"否");
    
}
- (IBAction)simpleReadWrite:(UIButton *)sender {
    NSString *fileName=@"myFile.txt";
    NSString *filePath=[[MCFileManager cacheDirectory] stringByAppendingPathComponent:fileName];
    NSString *content=@"你好";
    
    //写入文件
    BOOL result=[MCFileManager writeString:content toPath:filePath];
    if (result) {
        NSLog(@"写入文件%@成功",fileName);
    }else{
        NSLog(@"写入文件%@失败",fileName);
    }
    
    //读文件
    NSString *readResult=[MCFileManager readFileFromPath:filePath];
    NSLog(@"文件内容：%@",readResult);
}

- (IBAction)fileAdvancedReadWrite:(UIButton *)sender {
    NSString *fileName=@"myFile.txt";
    NSString *filePath=[[MCFileManager cacheDirectory] stringByAppendingPathComponent:fileName];
    NSString *content=@"你好";
    
    //覆盖写入文件
    BOOL  result=[MCFileManager writeStringUsingFileHandle:content toPath:filePath];
    if (result) {
        NSLog(@"写入文件：%@成功",fileName);
    }else{
         NSLog(@"写入文件：%@失败",fileName);
    }
    
    //读取文件内容
    NSString *fileContent=[MCFileManager readFileUsingFileHandleFromPath:filePath];
    NSLog(@"文件内容为：%@",fileContent);
    
     NSString *content_append=@"泡面";
    //追加写入文件
    BOOL  result_append=[MCFileManager appendStringUsingFileHandle:content_append toPath:filePath];
    if (result_append) {
        NSLog(@"追加写入文件：%@成功",fileName);
    }else{
        NSLog(@"追加写入文件：%@失败",fileName);
    }
    
    //读取文件内容
    NSString *fileContent_again=[MCFileManager readFileUsingFileHandleFromPath:filePath];
    NSLog(@"文件内容为：%@",fileContent_again);
}

- (IBAction)convertDictAndFile:(UIButton *)sender {
    NSString *filename=@"myKeyValue.plist";
    NSString *filepath=[[MCFileManager cacheDirectory] stringByAppendingPathComponent:filename];
    NSDictionary *dict=@{@"key1":@"value1",@"key2":@"value2"};
    
    //写入plist文件内容(每次写，原内容消失)
    BOOL result=[MCFileManager saveDictionary:dict isPlistFileOfPath:filepath];
    if (result) {
        NSLog(@"文件%@写入成功",filename);
    }else{
        NSLog(@"文件%@写入失败",filename);
    }
    
    //读取plist文件内容
    NSDictionary *dictContent=[MCFileManager dictionaryInPlistFileOfPath:filepath];
    NSLog(@"plist文件内容:%@",dictContent);
}

- (IBAction)fileBundleFilePath:(UIButton *)sender {
    NSString* fileName=@"myBundleFile.txt";
    NSString* filePath=[[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    NSLog(@"文件的路径:%@",filePath);
}

- (IBAction)printSandBox:(UIButton *)sender {
    [MCFileManager printHierachyOfSandBox];
}

- (IBAction)logToFile:(UIButton *)sender {
//    [MCFileManager logWithFormat:@"%@,%@",@"hello",@"你好"];
    PLog(@"%@,%@",@"hello",@"你好");
}


@end
