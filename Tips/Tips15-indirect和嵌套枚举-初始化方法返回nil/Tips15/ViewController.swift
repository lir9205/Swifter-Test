//
//  ViewController.swift
//  Tips15
//
//  Created by 李芮 on 17/1/20.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

//定义结点
class Node<T> {
    let value: T?
    let next: Node<T>?
    
    init(value: T?, next:Node<T>?) {
        self.value = value
        self.next = next
    }
}
//枚举,结构体嵌套需用indirect关键字标记
//定义链表
 indirect enum LinkedList<Element: Comparable> {
    case Empty
    case Node(Element,LinkedList<Element>)
    
    func linkedListByRemovingElement(element: Element) -> LinkedList<Element> {
        /*与if语句相同的是，guard也是基于一个表达式的布尔值去判断一段代码是否该被执行。与if语句不同的是，guard只有在条件不满足的时候才会执行这段代码。你可以把guard近似的看做是Assert，但是你可以优雅的退出而非崩溃。*/
        //1是对你所期望的条件做检查，而非不符合你期望的。又是和assert很相似。如果条件不符合，guard的else语句就运行，从而退出这个函数
        //2如果通过了条件判断，可选类型的变量在guard语句被调用的范围内会被自动的拆包
        //3对你所不期望的情况早做检查，使得你写的函数更易读，更易维护。
        guard case let .Node(value, next) = self else {
            return .Empty
        }
        return value == element ? next : LinkedList.Node(value, next.linkedListByRemovingElement(element))
    }
}


//初始化方法返回nil
extension Int {
    init?(fromString:String) {
        self = 0
        var digit = fromString.characters.count - 1
        for c in fromString.characters {
            var number = 0
            if let n = Int(String(c)) {
                number = n
            }else {
                switch c {
                case "一": number = 1
                case "二": number = 2
                case "三": number = 3
                case "四": number = 4
                case "五": number = 5
                case "六": number = 6
                case "七": number = 7
                case "八": number = 8
                case "九": number = 9
                case "零": number = 0
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
        
        let linkedList = LinkedList.Node(1, .Node(2, .Node(3, .Node(4, .Empty))))
        print(linkedList)
        
        let result = linkedList.linkedListByRemovingElement(3)
        print(result)
        
        let number1 = Int(fromString: "12")//12
        let number2 = Int(fromString: "三二五")//325
        let number3 = Int(fromString: "七9八")//798
        let number4 = Int(fromString: "吃了吗")//nil
        let number5 = Int(fromString: "1a4n")//nil
        
        
        print(number1!)
        print(number2!)
        print(number3!)
        print(number4)
        print(number5)
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

