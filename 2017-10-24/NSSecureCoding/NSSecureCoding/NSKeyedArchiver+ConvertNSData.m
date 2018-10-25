//
//  NSKeyedArchiver+ConvertNSData.m
//  NSSecureCoding
//
//  Created by jitengjiao      on 2017/10/24.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "NSKeyedArchiver+ConvertNSData.h"

@implementation NSKeyedArchiver (ConvertNSData)

+(NSData *)dataWithCustomClass:(id<NSSecureCoding>)customClassObject{
    NSMutableData *data=[NSMutableData data];
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver setRequiresSecureCoding:YES];
    [archiver encodeObject:customClassObject forKey:NSKeyedArchiveRootObjectKey];
    [archiver finishEncoding];
    return [data copy];
}
@end
