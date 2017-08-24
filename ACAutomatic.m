//
//  ACAutomatic.m
//  Test
//
//  Created by 周贺伟 on 2017/8/24.
//  Copyright © 2017年 zhouhewei. All rights reserved.
//

#import "ACAutomatic.h"
#import "ACNode.h"
#import "ACQueue.h"

@implementation SearchResult

- (instancetype)initWithString:(NSString*)str location:(long)location
{
    self = [super init];
    if (self) {
        _range = NSMakeRange(location, [str length]);
        _str = str;
    }
    
    return self;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%@,%@", NSStringFromRange(_range), _str];
}

@end

@interface ACAutomatic ()
{
    ACQueue*    _queue;
    ACNode*     _root;
}

@end

@implementation ACAutomatic

- (instancetype)init
{
    self = [super init];
    if (self) {
        _root = [[ACNode alloc] init];
        _queue = [[ACQueue alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [self destroyCurrentAC];
}

- (NSArray*)searchString:(NSString*)searchStr
{
    
    NSMutableArray* result = [[NSMutableArray alloc] init];
    ACNode *p = _root;
    unsigned long  strLen = [searchStr length];
    
    for (int i = 0; i < strLen; ++i) {
        
        NSString* temp = [searchStr substringWithRange:NSMakeRange(i, 1)];
        ACNode* node = [p.next objectForKey:temp];
        
        while (!node && p != _root) {
            p = p.failed;
            node = [p.next objectForKey:temp];
        }
        
        p = node;
        
        if (!p) {
            p = _root;
        }
        
        ACNode* tempNode = p;
        while (tempNode != _root) {
            if (tempNode.storeString) {
                [result addObject:[[SearchResult alloc] initWithString:tempNode.storeString location:i - tempNode.storeString.length + 1]];
            } else {
                break;
            }
            
            tempNode = tempNode.failed;
        }
    }
    
    return result;
}

- (void)insertString:(NSString*)aString
{
    ACNode *p = _root;
    unsigned long  strLen = [aString length];
    
    for (int i = 0; i < strLen; ++i) {
        NSString* temp = [aString substringWithRange:NSMakeRange(i, 1)];
        ACNode* node = [p.next objectForKey:temp];
        if (!node) {
            ACNode* newNode = [[ACNode alloc] init];
            [p.next setObject:newNode forKey:temp];
            node = newNode;
        }
        
        p = node;
    }
    
    p.storeString = aString;
}

- (void)insertStrings:(NSArray<NSString*>*)strings
{
    [strings enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self insertString:obj];
    }];
}

- (void)destroyCurrentAC
{
    [self destroy];
}

- (void)build
{
    [self buildFailPointer];
}

#pragma --mark private
- (void)buildFailPointer
{
    [_queue clean];
    [_queue inQueue:_root];
    
    while(![_queue isEmpty])
    {
        ACNode* temp = [_queue deQueue];
        
        [temp.next enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, ACNode * _Nonnull obj, BOOL * _Nonnull stop) {
            ACNode *p;
            
            if (temp == _root) {
                obj.failed = _root;
            } else {
                p = temp.failed;
                while(p){
                    
                    ACNode* nextNode = [p.next objectForKey:key];
                    if (nextNode) {
                        obj.failed = nextNode;
                        break;
                    }
                    p = p.failed;
                }
                
                if (!p) {
                    obj.failed = _root;
                }
            }
            
            [_queue inQueue:obj];
        }];
    }
}

- (void)destroy
{
    [_queue clean];
    [_queue inQueue:_root];
    
    while(![_queue isEmpty])
    {
        ACNode* temp = [_queue deQueue];
        
        [temp.next enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, ACNode * _Nonnull obj, BOOL * _Nonnull stop) {
            obj.failed = nil;
            [_queue inQueue:obj];
        }];
    }

}

@end
