//
//  KVOEg2.swift
//  Tips23-KVO
//
//  Created by 李芮 on 17/2/13.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation

//当无法修改想要观察的源码时，可以继承这个类并且将需要观察的属性使用dynamic重写。
class MyClass1: NSObject {
    var date = Date()
}


class MyChildClass: MyClass {
    dynamic override var date: Date {
        get { return super.date as Date }
        set { super.date = newValue }
    }
}

private var myContext = 0

class Class1: NSObject{
    
    var myObj:MyChildClass!
    
    override init() {
        super.init()
        myObj = MyChildClass()
        print("初始化MyChildClass，当前时间为： \(myObj.date)")
        myObj.addObserver(self, forKeyPath: "date", options:.new, context: &myContext)
        delay(3) { 
            self.myObj.date = Date()
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let change = change, context == &myContext {
            let newDate = change[NSKeyValueChangeKey.newKey]
            print("日期发生变化：\(newDate)")
        }
        
    }
    
    deinit {
        self.myObj.removeObserver(self, forKeyPath: "date")
    }
}

//对于非NSObject子类可以通过属性观察来实现监听功能。
