//
//  ViewController.swift
//  Tips13
//
//  Created by 李芮 on 17/1/19.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

class Parent {
     final func method() {
        print("开始配置")
        //...必要的代码
        
        methodImpl()
        
        //...必要的代码
        print("结束配置")
    }
    
    func methodImpl() {
        fatalError("子类必须实现这个方法")
//        print("父类的业务")
    }
}

class Child: Parent {
    override func methodImpl() {
        print("子类的业务")
    }
}





class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let child = Child()
        child.method()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

