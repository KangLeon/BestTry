//
//  MCFileManager.h
//  FileOperation
//
//  Created by jitengjiao      on 2017/10/23.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PLog(format,...) [MCFileManager logWithFormat:format,## __VA_ARGS__]

@interface MCFileManager : NSObject
+(NSString*)homeDirectory;
+(NSString*)documentsDirectory;
+(NSString*)libraryDirectory;
+(NSString *)cacheDirectory;
+(NSString *)tempDirectory;
+(BOOL)createDirectoryInPath:(NSString *)path directoryName:(NSString *)name;
+(BOOL)createFileInPath:(NSString*)path fileName:(NSString*)filename;
+(BOOL)fileExistInPath:(NSString*)path isDirectory:(BOOL *)isDirectory;
+(NSString *)readFileFromPath:(NSString *)path;
+(BOOL)writeString:(NSString*)content toPath:(NSString*)path;
+(NSString *)readFileUsingFileHandleFromPath:(NSString *)path;
+(BOOL)writeStringUsingFileHandle:(NSString *)content toPath:(NSString *)path;
+(BOOL)appendStringUsingFileHandle:(NSString *)content toPath:(NSString *)path;
+(BOOL)saveDictionary:(NSDictionary*)dict isPlistFileOfPath:(NSString *)path;
+(NSDictionary*)dictionaryInPlistFileOfPath:(NSString*)path;
+(void)printHierachyOfSandBox;
+(void)logWithFormat:(NSString *)format,...;
@end
