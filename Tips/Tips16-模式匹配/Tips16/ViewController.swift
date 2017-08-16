//
//  ViewController.swift
//  Tips16
//
//  Created by 李芮 on 17/1/20.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

//自定义模式匹配
//1 重载 ~= 操作符  让它接收一个 NSRegularExpression 作为模式，去匹配输入的string

func ~=(pattern: NSRegularExpression,input: String) -> Bool {
    return pattern.numberOfMatches(in: input,
                                           options: [],
                                           range: NSMakeRange(0, input.characters.count)) > 0
}

//2 添加一个将字符串转化为 NSRegularExpression 的操作符（也可以使用StringLiteralConvertible）

prefix operator ~/

prefix func ~/(pattern: String) -> NSRegularExpression {
    return try! NSRegularExpression(pattern: pattern, options: [])
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contact = ("http://onvcat.com", "onev@onvcat.com")
        let mailRegex: NSRegularExpression
        let siteRegex: NSRegularExpression
        
        //将字符串转化为  NSRegularExpression (正则表达式)
        mailRegex =
             ~/"^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        siteRegex =
             ~/"^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
        
        
        //swfit里的switch 就是使用~=操作符进行模式匹配，case指定的模式作为左参数输入，而等待匹配的被switch的元素作为操作符的右参数输入。
        //这个调用是由swift隐式地完成的。这里重载~=操作符，就可以按照我们自定义的模式进行匹配了
        switch contact {
        case (siteRegex, mailRegex):
            print("同时拥有有效的网站和邮箱")
        case (_, mailRegex):
            print("只拥有有效的邮箱")
        case (siteRegex, _):
            print("只拥有有效的网站")
        default:
            print("啥都没有")
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

