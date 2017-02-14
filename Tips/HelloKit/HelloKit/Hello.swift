
//
//  Hello.swift
//  HelloKit
//
//  Created by 李芮 on 17/2/14.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation
//注意我们在这里添加了 public 声明,这是因为我们的目的是在当前 module 之外使用这些代码
public class Hello {
    public class func sayHello() {
        print("Hello Kit")
    }
}