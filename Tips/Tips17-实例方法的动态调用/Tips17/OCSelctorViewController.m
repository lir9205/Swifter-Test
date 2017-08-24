//
//  OCSelctorViewController.m
//  Tips17
//
//  Created by admin on 2017/8/16.
//  Copyright © 2017年 7feel. All rights reserved.
//

#import "OCSelctorViewController.h"

@interface OCSelctorViewController ()

@end

@implementation OCSelctorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    SEL someMethod = @selector(callMe);
    SEL anotherMethod = @selector(callMeWithParam:);

    // 或者也可以使用 `NSSelectorFromString`
    //SEL someMethod = NSSelectorFromString(@"callMe");
    //SEL anotherMethod = NSSelectorFromString(@"callMeWithParam:");
    
}

- (void)callMe {
    //...
}

- (void)callMeWithParam:(id)obj {
    //...
}


@end
