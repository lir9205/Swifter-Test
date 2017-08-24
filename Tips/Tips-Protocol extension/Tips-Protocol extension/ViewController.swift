//
//  ViewController.swift
//  Tips-Protocol extension
//
//  Created by admin on 2017/8/15.
//  Copyright © 2017年 lirui. All rights reserved.
//

import UIKit

//MARK: - protocol extension

protocol A2 {
    func method1() -> String
}

extension A2 {
    func method1() -> String {
        return "hi"
    }
    
    func method2() -> String {
        return "hi"
    }
}

struct B2: A2 {
    func method1() -> String {
        return "Hello"
    }
    func method2() -> String {
        return "Hello"
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let b2 = B2()
        print(b2.method1())//Hello
        print(b2.method2())//Hello
        
        let a2  = b2 as A2
        print(a2.method1())//Hello
        print(a2.method2())//Hi
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

