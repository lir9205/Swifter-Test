//
//  ViewController.swift
//  Tips17 - 实例方法的动态调用
////  Created by 李芮 on 17/1/20.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

/******   实例方法的动态调用    *******/

class MyClass {
    func method(number: Int) -> Int {
        return number + 1
    }
    //当有类型方法名字冲突时
//    class func method(number: Int) -> Int {
//        return number
//    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //通过创建实例使用实例.语法调用
        let object = MyClass()
        let number = object.method(1)
        
        // 使用 Type.instanceMethod 的语法来生成一个可以 柯里化 的方法
        let f = MyClass.method  // f: (MyClass) -> (Int) -> Int
        // let f = MyClass.method   相当于  let f = { (obj: MyClass) in obj.method }
        let obj = MyClass()
        let result = f(obj)(1)
        print(number + result)
        
        
         //当有类型方法名字冲突时  显示的加上类型声明加以区分
//         //class func method
//        let f1 = MyClass.method
//        //class func method 和 f1相同
//        let f2: Int -> Int = MyClass.method
//        
//         //func method 的 柯里化版本
//        let f3: (MyClass) -> Int -> Int = MyClass.method
        

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

