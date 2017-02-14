//
//  AppDelegate.m
//  OCAndSwift
//
//  Created by 李芮 on 17/1/21.
//  Copyright © 2017年 7feel. All rights reserved.
//

#import "AppDelegate.h"
#import "OCAndSwift-Swift.h"


/* 总结：
 ## Swift中使用OC代码
 1. 创建 工程名-Bridging-Header.h 文件，在文件中导入要使用的OC头文件 #import "MyClass.h"
 2. 配置 工程名-Bridging-Header.h文件路径 build setting -> Objective-C Bridging Header -> $(SRCROOT)/OCAndSwift/OCAndSwift-Bridging-Header.h

 
 ## OC中使用同一个项目中的Swift代码
 1.系统自动为我们生成了头文件（需要我们的swift类是NSObject的直接或间接的子类，swift会默认自动为所有的非private的类和成员加上@objc, 注意 如果需要将private的类和成员需要暴露给Objective-C，需要我们手动添加@objc修饰符），我们只要引入
   项目名-Swift.h  (#import "OCAndSwift-Swift.h")
   
   当项目名中含有 - 时，- 会转为 _, 如工程名为Tips-OCAndSwift时，生成的头文件是 Tips_OCAndSwift-Swift.h
 
 2.如果不是NSObject的子类的话，需要将暴露给Objective-C的任何地方（类，属性和方法等）的声明前加上@objc修饰词。
 
 
 ## OC中使用来自外部的Swift框架
 @import MySwiftKit；
 */




@interface AppDelegate ()



@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    MyController *mainVc  = [[MyController alloc] init];
    self.window.rootViewController = mainVc;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
