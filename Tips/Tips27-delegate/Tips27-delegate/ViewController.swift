//
//  ViewController.swift
//  Tips27-delegate
//
//  Created by admin on 2017/8/25.
//  Copyright © 2017年 lirui. All rights reserved.
//

import UIKit

// weak var delegate: MyClassDelegate? 编译错误
// 'weak' may only be applied to class and class-bound protocol types, not 'MyClassDelegate'
//protocol MyClassDelegate {
//    func method()
//}

// 想要在Swift中使用weak delegate，我们就需要将protocol限制在class内
// 解决办法一:
// 将protocol声明为 Objective-C 的,在 Protocol 前加上 @objc, Objective-C 的 protocol 都只有类能实现,因此使用 weak 来修饰就合理了

//@objc protocol MyClassDelegate {
//    func method()
//}

// 解决办法二:
// 在protocol声明的名字后面加上 class ，这可以为编译器显式地指明这个protocol只能由 class 来实现。
protocol MyClassDelegate: class {
    func method()
}

class MyClass {
    weak var delegate: MyClassDelegate?
}


class ViewController: UIViewController, MyClassDelegate {
    
    var someInstance: MyClass!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        someInstance = MyClass()
        someInstance.delegate = self
    }
    
    func method() {
        print("Do something")
    }

    //...
}


