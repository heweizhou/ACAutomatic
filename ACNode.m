//
//  ACNode.m
//  Test
//
//  Created by 周贺伟 on 2017/8/24.
//  Copyright © 2017年 zhouhewei. All rights reserved.
//

#import "ACNode.h"

@implementation ACNode

- (instancetype)init
{
    self = [super init];
    if (self) {
        _next = [[NSMutableDictionary alloc] init];
        _failed = nil;
        _storeString = nil;
    }
    
    return self;
}
@end
