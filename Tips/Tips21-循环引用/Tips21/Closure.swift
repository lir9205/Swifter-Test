//
//  Closure.swift
//  Tips21
//
//  Created by 李芮 on 17/1/22.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation


class Person {
    let name: String
    
    //这种在闭包参数的位置进行标注的语法结构是将要标注的内容放在原来的参数面前，并使用中括号括起来呢。
//    { [unowned self, weak someobject] (number: Int) -> Bool in
//        return true
//    }
    
    lazy var printName:()->() = {
        [weak self] in        
        if let strongSelf = self {
            print("The name is \(strongSelf.name)")
        }
    }
    
    init(personName: String) {
        name = personName
    }
    
    deinit {
        print("Person deinit \(self.name)")
    }
    
}



