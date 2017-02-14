//
//  ViewController.swift
//  ReTest
//
//  Created by 李芮 on 17/2/9.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

class MyClass{
    func method(number: Int) -> Int {
        return number + 1
    }
    
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 使用@objc将接口暴露给Objective-C
//        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(callMe), userInfo: nil, repeats: true)
        
        let someMethod = #selector(callMe(_:))
        let turnByAngle1 = #selector(turnByAngle(_:speed:))
        let turnByAngle2 = #selector(turnByAngle)
        
        //同一作用域内函数名相同的情况
        let commonMethod1 = #selector(commonFunc as () -> ())
        let commonMethod2 = #selector(commonFunc as Int -> Int)
        
        //实例方法的动态调用
        let f = MyClass.method  //let f: (MyClass) -> (Int) -> Int
        
        let f1 = { (obj: MyClass) in obj.method}
        
        
        
        
        let myclass = MyClass()
        
        let three = f(myclass)(2)
        
        
        
        
        
        print(three)
        
        
    }

    // 使用@objc将swift中的私有接口暴露给Objective-C
    //@objc 只能使用在类的成员，类的扩展，协议
    @objc private func callMe(name: String) {
        //...
    }
    
    

    func turnByAngle(theAngle: Int,speed: Float) {
        
    }
    
    func commonFunc() {
        
    }
    
    func commonFunc(input: Int) -> Int {
        return input
    }
}

