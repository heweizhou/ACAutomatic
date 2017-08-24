//
//  ACQueue.h
//  Test
//
//  Created by 周贺伟 on 2017/8/24.
//  Copyright © 2017年 zhouhewei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACQueue : NSObject

- (void)inQueue:(id)object;
- (id)deQueue;
- (BOOL)isEmpty;
- (void)clean;

@end
