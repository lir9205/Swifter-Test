//
//  MyClass.m
//  OCAndSwift
//
//  Created by 李芮 on 17/1/21.
//  Copyright © 2017年 7feel. All rights reserved.
//

#import "MyClass.h"
#import "OCAndSwift-Swift.h"

@implementation MyClass

- (void)logC {
    NSLog(@"这是Objective-C中的方法");
    
    MySwift *swift = [[MySwift alloc] init];
    [swift logSwift];
    
    ClassB *b = [[ClassB alloc] init];
    [ClassB greeting:@"lily"];
}
@end
