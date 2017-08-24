//
//  ACQueue.m
//  Test
//
//  Created by 周贺伟 on 2017/8/24.
//  Copyright © 2017年 zhouhewei. All rights reserved.
//

#import "ACQueue.h"

@interface ACQueue ()
{
    NSMutableArray* _queue;
}
@end

@implementation ACQueue

- (instancetype)init
{
    self = [super init];
    if (self) {
        _queue = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)inQueue:(id)object
{
    [_queue addObject:object];
}

- (id)deQueue
{
    if ([self isEmpty]) {
        return nil;
    }
    
    id value = _queue.firstObject;
    [_queue removeObjectAtIndex:0];
    return value;
}

- (BOOL)isEmpty
{
    return _queue.count == 0;
}

- (void)clean
{
    [_queue removeAllObjects];
}

@end
