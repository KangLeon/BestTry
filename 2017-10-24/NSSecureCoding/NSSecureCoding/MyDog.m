//
//  MyDog.m
//  NSSecureCoding
//
//  Created by jitengjiao      on 2017/10/24.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import "MyDog.h"

@implementation MyDog

+(BOOL)supportsSecureCoding{
    return YES;
}

//解码方法
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super init]) {
        if (aDecoder) {
            _name=[aDecoder decodeObjectOfClass:[NSString class] forKey:@"name"];
            _age=[aDecoder decodeIntegerForKey:@"age"];
        }
    }
    return self;
}

//编码方法
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_name forKey:@"name"];
    [aCoder encodeInteger:_age forKey:@"age"];
}



@end
