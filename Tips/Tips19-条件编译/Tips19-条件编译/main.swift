//
//  main.swift
//  Tips19-条件编译
//
//  Created by 李芮 on 17/1/21.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit


class MyApplication: UIApplication {
    override func sendEvent(_ event: UIEvent) {
        super.sendEvent(event)
        print("event sent: \(event)");
    }
}

//CommandLine 当前进程的命令行参数
UIApplicationMain(CommandLine.argc,
                  UnsafeMutableRawPointer(CommandLine.unsafeArgv)
                    .bindMemory(
                        to: UnsafeMutablePointer<Int8>.self,
                        capacity: Int(CommandLine.argc)),
                  NSStringFromClass(MyApplication.self),
                  NSStringFromClass(AppDelegate.self))







