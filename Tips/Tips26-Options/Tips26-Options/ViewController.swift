//
//  ViewController.swift
//  Tips26-Options
//
//  Created by 李芮 on 17/2/13.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit


struct MyOption: OptionSetType {
    let rawValue: UInt
    
    static let none = MyOption(rawValue: 0)
    static let option1 = MyOption(rawValue: 1)
    static let option2 = MyOption(rawValue: 1 << 1)
    static let option3 = MyOption(rawValue: 1 << 2)
    //...
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var options:[MyOption] = [.none, .option1]
        options = []
        
        
        var result = 0
        
        for (idx, num) in [1,2,3,4,5].enumerate() {
            result += num
            if idx == 2 {
                break
            }
        }
        print(result)
        
        
        let diceFaceCount: UInt32 = 6
        
        let randomRoll = Int(arc4random_uniform(diceFaceCount)) + 1
        
        print(randomRoll)//1...6
        
        
        
        for _ in 0...100 {
            let range = Range<Int>(1...6)
            print(random(in: range))
        }
        
        
    }
    //随机返回一个区间范围的数
    func random(in range: Range<Int>) -> Int {
        let count = UInt32(range.endIndex - range.startIndex)
        return Int(arc4random_uniform(count)) + range.startIndex
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

