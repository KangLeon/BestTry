//
//  NSKeyedUnarchiver+ConvertNSData.h
//  NSSecureCoding
//
//  Created by jitengjiao      on 2017/10/24.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSKeyedUnarchiver (ConvertNSData)
+(id<NSSecureCoding>)customInstanceFromData:(NSData*)data ForClass:(Class)classtype;
@end
