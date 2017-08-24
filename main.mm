//
//  main.c
//  Test
//
//  Created by 周贺伟 on 2017/2/27.
//  Copyright © 2017年 zhouhewe. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include "ACAutomatic.h"

int main(int argc, const char * argv[]) {
    
    
    ACAutomatic* ac = [[ACAutomatic alloc] init];
    
    [ac insertString:@"我的"];
    [ac insertString:@"你的"];
    [ac insertString:@"他的"];
    [ac insertString:@"你我的"];
    [ac insertString:@"眼睛里"];
    
    [ac build];
    
    NSArray* arr = [ac searchString:@"11春天在哪里，春天在你的眼睛里，oh, my god, 春天在他的眼睛里，春天在你我的眼睛里"];
    NSLog(@"%@", arr);

}

