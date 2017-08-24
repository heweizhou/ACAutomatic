//
//  ACAutomatic.h
//  Test
//
//  Created by 周贺伟 on 2017/8/24.
//  Copyright © 2017年 zhouhewei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchResult : NSObject
@property (readonly, nonatomic, assign) NSRange       range;
@property (readonly, nonatomic, copy)   NSString*     str;

@end

//thread unsafe class

@interface ACAutomatic : NSObject

- (void)insertString:(NSString*)aString;
- (void)insertStrings:(NSArray<NSString*>*)strings;

- (NSArray*)searchString:(NSString*)searchStr;

- (void)build;
- (void)destroyCurrentAC;

@end
