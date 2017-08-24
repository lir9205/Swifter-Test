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
    case empty
    case node(Element,LinkedList<Element>)
    
    func linkedListByRemovingElement(_ element: Element) -> LinkedList<Element> {
        /*与if语句相同的是，guard也是基于一个表达式的布尔值去判断一段代码是否该被执行。与if语句不同的是，guard只有在条件不满足的时候才会执行这段代码。你可以把guard近似的看做是Assert，但是你可以优雅的退出而非崩溃。*/
        //1是对你所期望的条件做检查，而非不符合你期望的。又是和assert很相似。如果条件不符合，guard的else语句就运行，从而退出这个函数
        //2如果通过了条件判断，可选类型的变量在guard语句被调用的范围内会被自动的拆包
        //3对你所不期望的情况早做检查，使得你写的函数更易读，更易维护。
        guard case let .node(value, next) = self else {
            return .empty
        }
        return value == element ? next : LinkedList.node(value, next.linkedListByRemovingElement(element))
    }
}





class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let list = Node(value: 1,
                        next: Node(value: 2,
                                   next: Node(value: 3,
                                              next: Node(value: 4, next: nil))))
        print(list)
        
        let linkedList = LinkedList.node(1, .node(2, .node(3, .node(4, .empty))))
        print(linkedList)
    
        let result = linkedList.linkedListByRemovingElement(3)
        print(result)
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

