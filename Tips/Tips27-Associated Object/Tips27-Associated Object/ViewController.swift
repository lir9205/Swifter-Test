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

    func printTitle(input: MyClass) {
        if let title = input.title {
            print("title: \(title)")
        } else {
            print("没有设置title")
        }
    }


}

