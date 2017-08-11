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

extension MyBool : ExpressibleByBooleanLiteral {
    init(booleanLiteral value: Bool) {
        self = value ? .myTrue : .myFalse
    }
}

//通过名字(字符串)创建Person对象
class Person: ExpressibleByStringLiteral {
    let name: String
    
    init (name value: String) {
        self.name = value
    }
    
    required  convenience init(stringLiteral value: String) {
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

//MARK: - designed convenience required

class ClassA {
    let numA : Int
    required init(num: Int) {
        numA = num
    }
    
    convenience init(bigNum: Bool) {
        self.init(num: bigNum ? 1000 : 1)
    }
}

class ClassB: ClassA {
    let numB: Int
    
    required init(num: Int) {
        numB = num + 1
        super.init(num: num)
    }
}



//MARK: - 初始化返回nil

extension Int {
    init?(fromString: String) {
        self = 0
        var digit = fromString.characters.count - 1
        for c in fromString.characters {
            var number = 0
            if let n = Int(String(c)) {
                number = n
            }
            else {
                switch c {
                case "一":
                    number = 1
                case "二":
                    number = 2
                case "三":
                    number = 3
                case "四":
                    number = 4
                case "五":
                    number = 5
                case "六":
                    number = 6
                case "七":
                    number = 7
                case "八":
                    number = 8
                case "九":
                    number = 9
                case "零":
                    number = 0
                default:
                    return nil
                }
                
            }
            self = self + number * Int(pow(10, Double(digit)))
            digit = digit - 1
        }
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
        
        let b = ClassB(bigNum: true)
        print(b.numB)
        print(b.numA)
        
        
        let number1 = Int(fromString: "12");
        print(number1)
        let number2 = Int(fromString: "三二五");
        print(number2)
        let number3 = Int(fromString: "七9八");
        print(number3)
        let number4 = Int(fromString: "吃了吗");
        print(number4)
        let number5 = Int(fromString: "1a4n");
        print(number5)
        
        //Optional(12)
        //Optional(325)
        //Optional(798)
        //nil
        //nil
        
        // CustomStringConvertible
        let mixed1:[CustomStringConvertible] = [1,"two", 3]
        for obj in mixed1 {
            print(obj.description)
        }
        
        
        
        let mixed = [IntOrString.intValue(1),
                     IntOrString.stringValue("two"),
                     IntOrString.intValue(3)]
        for value in mixed {
            switch value {
            case let .intValue(i):
                print(i*2)
            case let .stringValue(s):
                print(s.capitalized)//首字母大写
            }
        }
        
        
    
    }


}



//使用枚举封装数据
enum IntOrString {
    case intValue(Int)
    case stringValue(String)
}
