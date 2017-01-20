//
//  ViewController.swift
//  Tips10
//
//  Created by 李芮 on 17/1/19.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit


//在Cocoa中使用NSRegularExpression来做正则匹配。
struct RegexHelper {
    let regex : NSRegularExpression
    
    init (_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern,
                                        options: .CaseInsensitive)
    }
    
    func match(input: String) -> Bool {
        let matches = regex.matchesInString(input,
                                            options: [],
                                            range: NSMakeRange(0, input.characters.count))
        return matches.count > 0
    }
    
}

infix operator =~ {
associativity none
precedence 130
}

func =~(lhs: String, rhs: String) -> Bool {
    do {
        return try RegexHelper(rhs).match(lhs)
    }catch {
        return false
    }
}

//模式匹配
//重载 ~=操作符
func ~=(pattern: NSRegularExpression, input: String) -> Bool {
    return pattern.numberOfMatchesInString(input,
                                           options: [],
                                           range: NSMakeRange(0, input.characters.count)) > 0
}

prefix operator -/ {}

//prefix func -/(pattern: String) -> NSRegularExpression {
//    return  NSRegularExpression(pattern: pattern, options: [])
//}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        
        //        let matcher : RegexHelper
        //        do {
        //            matcher = try RegexHelper(mailPattern)
        //        }
        
        let maybeMailAddress = "onev@onevcat.com"
        if maybeMailAddress =~ mailPattern {
            print("有效的邮箱地址")
        }
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

