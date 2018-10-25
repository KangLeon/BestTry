//
//  MyDog.h
//  NSSecureCoding
//
//  Created by jitengjiao      on 2017/10/24.
//  Copyright © 2017年 MJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDog : NSObject<NSSecureCoding>

@property(nonatomic,strong)NSString *name;
@property(nonatomic,assign)NSInteger age;


@end
