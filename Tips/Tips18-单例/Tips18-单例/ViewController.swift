//
//  ViewController.swift
//  Tips18-单例
//
//  Created by 李芮 on 17/1/21.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit


//MARK: - static and class


protocol MyProtocol {
    // 在 protocol 中使用 static 定义类型域上的方法和计算属性
    static func foo() -> String
}

struct MyStruct: MyProtocol {
    // 在 struct 中使用 static 定义类型方法和类型属性
    static func foo() -> String {
        return "MyStruct"
    }
}

enum MyEnum: MyProtocol {
    // 在 enum 中使用 static 定义类型方法和类型属性
    static func foo() -> String {
        return "MyEnum"
    }
}


class MyClass: MyProtocol {
    // 在class中既可以使用class 定义类方法和计算属性
    class func foo() -> String {
         return "MyClass.foo()"
    }
    // 也可以使用static
    static func bar() -> String {
        return "MyClass.bar()"
    }
    
}

//MARK: - 单例

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyManager.sharedManager.method()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

