//
//  MCFileManager.m
//  FileOperation
//
//  Created by jitengjiao      on 2017/10/23.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "MCFileManager.h"



@implementation MCFileManager

//获取沙盒根目录
+(NSString*)homeDirectory{
    return NSHomeDirectory();
}

//获取Documents目录
+(NSString*)documentsDirectory{
    NSString *documentsDir=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) firstObject];
    return documentsDir;
}
//获取Library目录
+(NSString*)libraryDirectory{
    NSString *libraryDir=[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
    return libraryDir;
}
//获取Cache目录
+(NSString *)cacheDirectory{
    NSString *cacheDir=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    return cacheDir;
}
//获取Tmp目录
+(NSString *)tempDirectory{
    return NSTemporaryDirectory();;
}

//创建文件夹createDirectoryAtPath：
+(BOOL)createDirectoryInPath:(NSString *)path directoryName:(NSString *)name{
    //获取文件管理器
    NSFileManager *fileManager=[NSFileManager defaultManager];
    NSString *newDirectory=[path stringByAppendingPathComponent:name];//创建新的文件夹路径
    //创建目录
    BOOL result=[fileManager createDirectoryAtPath:newDirectory withIntermediateDirectories:YES attributes:nil error:nil];
    if (result) {
        //创建成功
        return YES;
    }else{
        //创建失败
        return NO;
    }
}

//创建文件createFileAtPath:
+(BOOL)createFileInPath:(NSString*)path fileName:(NSString*)filename{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    //新文件的完整路径
    NSString *newFilePath=[path stringByAppendingPathComponent:filename];
    BOOL result=[fileManager createFileAtPath:newFilePath contents:nil attributes:nil];
    if (result) {
        //创建成功
        return YES;
    }else{
        //创建失败
        return NO;
    }
}

//查询文件是否存在
+(BOOL)fileExistInPath:(NSString*)path isDirectory:(BOOL *)isDirectory{
    NSFileManager* fileManager=[NSFileManager defaultManager];
    //isDirectory:输出参数，如果路径存在，这个路径是一个文件还是一个文件夹
    BOOL exist=[fileManager fileExistsAtPath:path isDirectory:isDirectory];
    if (exist) {
        //存在
        return YES;
    }else{
        //不存在
        return NO;
    }
}

//读文件
+(NSString *)readFileFromPath:(NSString *)path{
   NSString *content=[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return content;
}


//写文件（覆盖写入,以前的内容被覆盖）
+(BOOL)writeString:(NSString*)content toPath:(NSString*)path{
    BOOL result=[content writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:nil];
    if (result) {
        //写入成功
        return YES;
    }else{
       //写入失败
        return NO;
    }
}

//NSFileHandle读文件
+(NSString *)readFileUsingFileHandleFromPath:(NSString *)path{
    NSFileHandle *file=[NSFileHandle fileHandleForReadingAtPath:path];
    if (file) {
        NSData *content=[file readDataToEndOfFile];
        [file closeFile];
        NSString *contentString=[[NSString alloc] initWithData:content encoding:NSUTF8StringEncoding];
        return contentString;
    }
    return nil;
}

//NSFileHandle写文件(覆盖写文件)
+(BOOL)writeStringUsingFileHandle:(NSString *)content toPath:(NSString *)path{
    if (![self fileExistInPath:path isDirectory:nil]) {
        //文件不存在，创建这个文件
        BOOL result=[[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
        if (result==NO) {
            return NO;
        }
    }
    NSFileHandle *file=[NSFileHandle fileHandleForWritingAtPath:path];
    if(file){
        //需要写入NSData类型
        NSData *datacontent=[content dataUsingEncoding:NSUTF8StringEncoding];
        [file truncateFileAtOffset:0];//文件内容从偏移量0开始切除，即清除文件内容
        [file writeData:datacontent];
        [file closeFile];
        return YES;
    }
    return NO;
}

//NSFileHandle写文件(追加写文件)
+(BOOL)appendStringUsingFileHandle:(NSString *)content toPath:(NSString *)path{
    if (![self fileExistInPath:path isDirectory:nil]) {
        //文件不存在，创建这个文件
        BOOL result=[[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
        if (result==NO) {
            return NO;
        }
    }
    NSFileHandle *file=[NSFileHandle fileHandleForWritingAtPath:path];
    if(file){
        //需要写入NSData类型
        NSData *datacontent=[content dataUsingEncoding:NSUTF8StringEncoding];
        [file seekToEndOfFile];//寻找文件的结尾
        [file writeData:datacontent];
        [file closeFile];
        return YES;
    }
    return NO;
}

//保存字典到plist文件
+(BOOL)saveDictionary:(NSDictionary*)dict isPlistFileOfPath:(NSString *)path{
    //判断dict是否是有效的字典
    if(dict && [dict isKindOfClass:[NSDictionary class]]){
        //dict有效
        BOOL result=[dict writeToFile:path atomically:YES];
        return result;
    }
    return NO;
}

//从plist文件中加载字典
+(NSDictionary*)dictionaryInPlistFileOfPath:(NSString*)path{
    //判断文件是否存在
    if ([self fileExistInPath:path isDirectory:nil]) {
        //文件存在
        NSDictionary *dict=[[NSDictionary alloc] initWithContentsOfFile:path];
        if (dict && [dict isKindOfClass:[NSDictionary class]]) {
            return dict;
        }
    }
    return nil;
}

//列出某个路径下的所有文件或文件夹
+(NSArray *)listForPath:(NSString*)path{
    NSArray *array=[[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];//列出目录下所有文件的文件和文件夹
    return array;
}


//递归打印某个路径下所有的文件和文件夹（level表示当前路径的深度）
+(void)recursionPrintListOfPath:(NSString*)path forLevel:(NSInteger)level{
    NSArray *fileList=[self listForPath:path];//获取指定路径下的文件和文件夹
    for (NSString* fileName in fileList) {
        //确定打印的缩进
        NSString *indent=@"";
        for (int i=0; i<level; i++) {
            indent=[indent stringByAppendingString:@"..."];
        }
        //打印这个文件名／文件夹名
        NSLog(@"%@/%@",indent,fileName);
        NSString *filePath=[path stringByAppendingPathComponent:fileName];
        BOOL isDirectory;
        
        [self fileExistInPath:filePath isDirectory:&isDirectory];
        //判断路径是一个文件还是一个文件夹
        if(isDirectory){
            //如果要打印的路径是一个文件夹 则递归打印这个文件夹下所有的文件和文件夹
            [self recursionPrintListOfPath:filePath forLevel:level+1];
        }
    }
}

//打印沙盒下所有的文件盒文件夹名
+(void)printHierachyOfSandBox{
    [self recursionPrintListOfPath:[self homeDirectory] forLevel:0];
}


//格式化log到文件中
+(void)logWithFormat:(NSString *)format,...{
    va_list paramList;
    va_start(paramList, format);//初始化参数列表
    
    NSString *longStri=[[NSString alloc] initWithFormat:format arguments:paramList];//生成格式化字符串
    NSString* logToStore=[longStri stringByAppendingString:@"\n"];
    va_end(paramList);//释放paramList内存
    
    //存储log
    //生成log存储的文件路径
    NSString *logPath=[[self cacheDirectory] stringByAppendingPathComponent:@"log.txt"];
    //存储log，追加内容到log文件中
    BOOL writeResult=[self appendStringUsingFileHandle:logToStore toPath:logPath];
    if (writeResult) {
        NSLog(@"%@",longStri);
    }else{
        NSLog(@"%@",longStri);
    }
    
}



@end
