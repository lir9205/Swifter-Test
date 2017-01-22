//
//  ViewController.swift
//  Tips21
//
//  Created by 李芮 on 17/1/22.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

/****  循环引用   ****/

class A {
    let b: B
    
    //在A的init方法中，我们生成了B的实例并将其存储在属性中。然后将A的实例付给了b.a。这样a.b和b.a将在初始化的时候形成循环引用。
    //
    init () {
        b = B()
        b.a = self
    }
    
    deinit {
        print("A deinit")
    }
    
}


class B {
    //在被动方使用weak 向编译器说明我们不希望持有a。这时当obj指向nil时，整个环境就没有对A的这个实例的持有了，于是这个实例可以得到释放。接着，这个被释放的实例上对b的引用也随着这次释放结束了作用域，所以B的引用也将归零，得到释放。
    weak var a: A? = nil
    
    
    deinit {
        print("B init")
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        如果能够确定在访问时不会已被释放的话，尽量使用unowned,如果存在释放的可能使用weak
        var obj:A? = A()
        obj = nil  //内存没有释放
        
        var manager = RequestManager()
        manager.sendRequest()
        
        
        var xiaoMing: Person? = Person(personName:"XiaoMing")
        xiaoMing!.printName()
        xiaoMing = nil
        
        
        let arr:NSMutableArray = NSMutableArray(array: ["hhh"])
        arr.addObject("ggg")
        print(arr)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

