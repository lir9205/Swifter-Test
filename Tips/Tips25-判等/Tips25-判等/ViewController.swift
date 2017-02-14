//
//  ViewController.swift
//  Tips25-判等
//
//  Created by 李芮 on 17/2/13.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let item1 = ToDoItem(udid: "iOS", title: "Objective-C")
        let item2 = ToDoItem(udid: "iOS", title: "Swift")
        
        if item1.isEqual(item2) {
            print("ios")
            print(item2.hashValue)
        }
    
        print("swifter.tips".MD5)
        
        let b = 1.3445
        let format =   String(format: "%.2f", b)//".2"
        print(format)
        
        
        let f = ".2"
       
        print("double: \(b.format(f))")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

