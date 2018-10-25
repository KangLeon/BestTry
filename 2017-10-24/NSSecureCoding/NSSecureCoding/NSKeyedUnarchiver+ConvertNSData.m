//
//  NSKeyedUnarchiver+ConvertNSData.m
//  NSSecureCoding
//
//  Created by jitengjiao      on 2017/10/24.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "NSKeyedUnarchiver+ConvertNSData.h"

@implementation NSKeyedUnarchiver (ConvertNSData)
+(id<NSSecureCoding>)customInstanceFromData:(NSData*)data ForClass:(Class)classtype{
    NSKeyedUnarchiver* unArchiver=[[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [unArchiver setRequiresSecureCoding:YES];
    
    return [unArchiver decodeObjectOfClass:[classtype class] forKey:NSKeyedArchiveRootObjectKey];
}
@end
