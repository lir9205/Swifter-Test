//
//  ViewController.swift
//  Tips27-Associated Object
//
//  Created by 李芮 on 17/2/13.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = MyClass()
        printTitle(a)
        a.title = "Swifter.tips"
        printTitle(a)
        

        
    }

    func printTitle(_ input: MyClass) {
        if let title = input.title {
            print("title: \(title)")
        } else {
            print("没有设置title")
        }
    }
    
    
    func myMethod(anObj: Any!) {
        objc_sync_enter(anObj)
        
        // 在 enter 和 exit 之间 anObj 不会被其他线程改变
        objc_sync_exit(anObj)
    }

    func myMethodLocked(anObj: Any!) {
        synchronized(anObj) { 
            // 在 括号内 anObj 不会被其他线程改变
        }
    }

}

func synchronized(_ lock: Any, closure:()->()) {
    
    objc_sync_enter(lock)
    
    closure()
    
    objc_sync_exit(lock)
}
