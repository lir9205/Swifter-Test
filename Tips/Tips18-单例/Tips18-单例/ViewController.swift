//
//  ViewController.swift
//  Tips18-单例
//
//  Created by 李芮 on 17/1/21.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

/******   单例   *******/

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyManager.sharedManager.method()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

