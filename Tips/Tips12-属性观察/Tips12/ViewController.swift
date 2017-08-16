//
//  ViewController.swift
//  Tips12
//
//  Created by 李芮 on 17/1/19.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit


//属性观察

class MyClass {
    
    let oneYearInSecond:TimeInterval = 365 * 24 * 60 * 60
    
    
    var date: Date {
        willSet {
            let d = date
            print("即将将日期从\(d) 设定至 \(newValue)")
        }
        
        didSet {
            
            if date.timeIntervalSince(oldValue) > oneYearInSecond {
                print("设定的时间太久了")
                date = Date().addingTimeInterval(oneYearInSecond)
            }
            
            print("已经将日期从\(oldValue) 设定至 \(date)")
            
        }
    }
    
    init() {
        date = Date()
    }
    
}

class A {
    //计算属性 不能有属性观察方法willSet和didSet，可以通过子类化重写父类属性来实现属性观察
    var number: Int {
     
        get {
            print("get")
            return 1
        }
        
        set {
            print("set")
        }
    }
    
}

class B: A {
    override var number: Int {
        willSet {
            print("will Set")
        }
        
        didSet {
            print("did Set")
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let foo = MyClass()
        foo.date = foo.date.addingTimeInterval(100_000_000)
        
        
        //get方法被调用是因为实现了didSet方法。didSet方法会用到oldValue，而这个oldValue是在set动作之前进行获取并存储待用，否则无法确保正确性。如果不实现didSet方法的话，这次get方法也将不存在
        let b = B()
        b.number = 0
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

