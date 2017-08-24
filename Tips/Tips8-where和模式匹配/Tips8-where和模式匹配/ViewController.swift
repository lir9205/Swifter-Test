//
//  ViewController.swift
//  Tips8-where和模式匹配
//
//  Created by admin on 2017/8/16.
//  Copyright © 2017年 lirui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. 在 `switch` 语句中，我们可以使用where来限定某些条件case：
        let name = ["王小二", "张三", "李四", "王二小"]
        name.forEach {
        
            switch $0 {
            case let x where x.hasPrefix("王"):
                print("\(x)是笔者本家")
            default:
                print("你好, \($0)")
            }
        
        }
        //输出：
        //王小二是笔者本家
        //你好, 张三
        //你好, 李四
        //王二小是笔者本家
        
        //2. 在 `for` 中我们也可以使用 `where` 来做类似的条件限定：
        let num: [Int?] = [48, 99, nil];
        let n = num.flatMap {$0} //
        print(n)
        for score in n where score > 60 {
            print("及格啦 - \(score)")
        }
        //输出： 及格啦 - 99
        
        
        // 和 for 循环中类似，我们也可以对可选绑定进行条件限定。不过在 Swift 3 中，`if let` 和 `guard let` 的条件不再使用 `where` 语句，而是直接和普通的条件判断一样，用逗号写在 `if` 或者 `guard` 的后面:
        
        num.forEach {
            if let score = $0, score > 60 {
                print("及格啦 - \(score)")
            }
            else {
                print(":(")
            }
        }
        
        // 输出：
        // :(
        // 及格啦 - 99
        // :(
        
        // 3.泛型中对方法的限定  !=
        
        // 4.协议扩展中的限定
        
        let sortableArray: [Int] = [3,1,2,4,5]
        let unSortableArray: [Any?] = ["Hello", 4, nil]
        
        print(sortableArray.sorted()) //[1, 2, 3, 4, 5]
        //print(unSortableArray.sorted())
        ///error: Missing argument for parameter 'by' in call
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

