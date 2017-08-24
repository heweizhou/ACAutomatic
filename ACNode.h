//
//  ACNode.h
//  Test
//
//  Created by 周贺伟 on 2017/8/24.
//  Copyright © 2017年 zhouhewei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ACNode : NSObject

@property(nonatomic, strong) NSMutableDictionary<NSString*, ACNode*>*   next;
@property(nonatomic, strong) ACNode*                                    failed;
@property(nonatomic, copy) NSString*                                    storeString;

@end
