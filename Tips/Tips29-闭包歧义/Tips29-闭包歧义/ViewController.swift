//
//  ViewController.swift
//  Tips29-闭包歧义
//
//  Created by 李芮 on 17/2/15.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

//
extension Int {
    func times(f:(Int) -> ()) {
        print("Int")
        for i in 1...self {
            f(i)
        }
    }
}
//
//typealias Void =（）；() 表示没有任何元素的多元组。
extension Int {
    func times(f: Void -> Void) {
        print("Void")
        for _ in 1...self {
            f()
        }
    }
}

extension Int {
    func times(f: (Int, Int) -> ()) {
        print("Turple")
        for i in 1...self {
            f(i,i)
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //避免歧义，尽量将类型补全
        3.times({(i: Int) -> () in
            print(i)
        })

        3.times { (i: Void) -> () in
            print(i)
        }
        
        3.times { (i: (Int, Int)) -> () in
            print(i)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

