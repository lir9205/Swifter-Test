//
//  ViewController.swift
//  HelloKitProject
//
//  Created by 李芮 on 17/2/14.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit
import HelloKit

class ViewController: UIViewController {

    /// a var
    var a = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Hello.sayHello()
        a = 10
        method(3)
        
        printLog("hello world")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
     a demo method
     
     - parameter input:an int number
     
     - returns: the string represents the input number
     */
    func method(input: Int) -> String {
        return String(input)
    }
    
    
    func printLog<T>(message: T,
                  file:String = #file,
        method:String = #function,
        line: Int = #line
        )  {
        #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method), \(message)")
        #endif
    }


}

