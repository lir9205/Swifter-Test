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
                                        options: .caseInsensitive)
    }
    
    func match(_ input: String) -> Bool {
        let matches = regex.matches(in:input,
                                            options:[],
                                            range: NSMakeRange(0, input.characters.count))
        return matches.count > 0
    }
    
}

// 定义新的操作符

infix operator =~: ComparisonPrecedence

func =~(lhs: String, rhs: String) -> Bool {
    do {
        return try RegexHelper(rhs).match(lhs)
    }catch _ {
        return false
    }
}



//模式匹配
//重载 ~=操作符
func ~=(pattern: NSRegularExpression, input: String) -> Bool {
    return pattern.numberOfMatches(in: input,
                                           options: [],
                                           range: NSMakeRange(0, input.characters.count)) > 0
}

prefix operator -/

//prefix func -/(pattern: String) -> NSRegularExpression {
//    return  NSRegularExpression(pattern: pattern, options: [])
//}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mailPattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
//
//        let matcher : RegexHelper
//        do {
//            matcher = try RegexHelper(mailPattern)
//            let maybeMailAddress = "onev@onevcat.com"
//            if matcher.match(maybeMailAddress) {
//                print("有效的邮箱地址")
//            }
//        } catch {
//            
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

