//
//  ViewController.swift
//  Tips6
//
//  Created by 李芮 on 17/1/17.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

enum MyBool: Int {
    case myTrue, myFalse
}

extension MyBool : BooleanLiteralConvertible {
    init(booleanLiteral value: Bool) {
        self = value ? myTrue : myFalse
    }
}

//通过名字(字符串)创建Person对象
class Person: StringLiteralConvertible {
    let name: String
    
    init (name value: String) {
        self.name = value
    }
    
    required convenience init(stringLiteral value: String) {
//        self.name = value
        self.init(name: value)
    }
    required convenience init(extendedGraphemeClusterLiteral value: String) {
        self.init(name: value)
    }
    required convenience init(unicodeScalarLiteral value: String) {
         self.init(name: value)
    }
    
}

class ClassA {
    let numA: Int
    
    required init(num: Int) {
        numA = num
    }
    
    convenience init(bignum: Bool) {
        self.init(num: bignum ? 10000 : 1)
    }
}

class ClassB: ClassA {
    let numB: Int
    
    required init(num: Int) {
        numB = num + 1
        super.init(num: num)
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let myTrue: MyBool = true
        let myFalse: MyBool = false
        
        print(myTrue.rawValue)
        print(myFalse.rawValue)
        
        let xiaoming:Person = "xiaoming"
        
        print(xiaoming.name)
        
        let b = ClassB(bignum: true)
        print(b.numB)
        print(b.numA)
        
        
        // CustomStringConvertible
        let mixed1:[CustomStringConvertible] = [1,"two", 3]
        for obj in mixed1 {
            print(obj.description)
        }
        
        
        
        let mixed = [IntOrString.IntValue(1),
                     IntOrString.StringValue("two"),
                     IntOrString.IntValue(3)]
        for value in mixed {
            switch value {
            case let .IntValue(i):
                print(i*2)
            case let .StringValue(s):
                print(s.capitalizedString)//首字母大写
            }
        }
        
        
    
    }


}



//使用枚举封装数据
enum IntOrString {
    case IntValue(Int)
    case StringValue(String)
}
