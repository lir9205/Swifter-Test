
//
//  KVOExample.swift
//  Tips23-KVO
//
//  Created by 李芮 on 17/2/10.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation

//swift中实现KVO （仅限于NSObject的子类），需将观测的对象标记为 dynamic 。
class MyClass: NSObject {
    dynamic var date =  Date()
}

private var myContext = 0

class Class: NSObject {
    var myObject: MyClass!
    
    override init() {
        super.init()
        myObject = MyClass()
        print("初始化 MyClass, 当前日期为：\(myObject.date)")
        myObject.addObserver(self,
                             forKeyPath: "date",
                             options: .new,
                             context: &myContext)
        
        delay(3) { 
            self.myObject.date = Date()
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?,
                                         of object: Any?,
                                                  change: [NSKeyValueChangeKey : Any]?,
                                                  context: UnsafeMutableRawPointer?) {
        if let change = change, context == &myContext {
            let a = change[NSKeyValueChangeKey.newKey]
            print("日期发生变化: \(String(describing: a))")
            
        }
    }
    
    deinit {
        self.myObject.removeObserver(self, forKeyPath: "date")
    }
    
}
