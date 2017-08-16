//
//  ViewController.swift
//  Tips1
//
//  Created by 李芮 on 17/1/16.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject> : TargetAction {
    weak var target: T?
    let action: (T) -> () -> ()
    
    func performAction() {
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case touchUpInside
    case valueChanged
    //...
}

class Control {
    var actions = [ControlEvent: TargetAction]()
    
    func setTarget<T: AnyObject>(_ target: T, action: @escaping (T) -> () -> (), controlEvent: ControlEvent) {
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
    }
    
    func removeTargetForControlEvent(_ controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(_ controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
    
    
}


class ViewController: UIViewController {

    let button = Control()
    
    func onButtonTap() {
        print("Button was tapped")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        button.setTarget(self, action: ViewController.onButtonTap, controlEvent: ControlEvent.touchUpInside)
        
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"];
        //闭包表达式语法
        let reverseNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2})
        //根据上下文推断语法
        let reverseNames1 = names.sorted (by: {(s1, s2) -> Bool in return s1 > s2 })
        //单表达式闭包隐式返回
        let reverseNames2 = names.sorted (by: {(s1, s2) -> Bool in s1 > s2 })
        //参数名称缩写
        let reverseNames3 = names.sorted(by: {$0 > $1})
        //运算符方法
        let reverseNames4 = names.sorted(by: >)
        
        
        /*尾随闭包 ：如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数,可以使用尾随闭包来增强函数的可读性。尾
        随闭包是一个书写在函数括号之后的闭包表达式,函数支持将其作为最后一个参数调用*/
        let reverseNames5 = names.sorted(){ $0 > $1 }
        //如果闭包表达式是函数或方法的唯一参数,则当你使用尾随闭包时,你甚至可以把 () 省略掉:
        let reverseNames6 = names.sorted { $0 > $1 }
        
        
        print(reverseNames)
        print(reverseNames1)
        print(reverseNames2)
        print(reverseNames3)
        print(reverseNames4)
        print(reverseNames5)
        print(reverseNames6)
        
        
        let digitNames = [0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
                          5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
        let numbers = [16, 58, 510]
        //尾随闭包且只有一个参数
        let strings = numbers.map {
            (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number%10]! + output
                number = number/10
            } while number > 0
           return output
         }
        
        print(strings)
        
        var str1: String?
        print(str1 ?? "empty")
        
        
        //无论你将函数和闭包赋值给一个常量还是变量，你实际上是将常量或变量的值设置为对应函数或闭包的引用。
        /*逃逸闭包：
            当一个闭包作为一个参数传递到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
        你定义接受闭包作为参数的函数时,你可以在参数名之前标注 @escaping ,用来指明这个闭包是允许“逃逸”出 这个函数的。
         
         在Swift中可以在参数名前标注 @noescape 来指明这个闭包是不允许逃逸出这个函数的。因为非逃逸闭包只能在函数体
         中被执行，不能脱离函数体执行，所以这使得编译器可以明确的知道运行时的上下文环境，进而做出优化。
         比如， sort(_:) 方法可以接受一个用于元素比较的闭包参数，它被指明为 @noescape ，因为排序结束后这个闭包就没用了。
 
         
         闭包是一个逃逸闭包,这意味着它需要显式地引用 self ，闭包是一个非逃逸闭包,这意味着它可以隐式引用
         self。因为编译器知晓非逃逸闭包的上下文环境，所以非逃逸闭包中可以不写 self 。
        */
        
        logIfTrue { () -> Bool in  2 > 1 }
        logIfTrue({ 3 > 1})
        /*自动闭包
            将一个表达式自动封装成一个闭包。
         */
        logIfTrueAutoClosure({3 > 0}())
        logIfTrueAutoClosure(4 > 1)
        
        
        let addTwo = addTo(2)//adder: 2
        let result = addTwo(6) //num:6
        
        
        print(result)
        
        let greaterThan10 = greaterThan(10)
        print(greaterThan10(14))
        print(greaterThan10(8))
        
        
        var level: Int?
//        var startLevel = addTwo(2)
        let currentLevel = level ?? addTwo(2)
        var currentLevel2 = ww(level, defaultValue: addTwo(2))
        
        print(currentLevel)
        
        if 99 > 0 && 22 < 6 {
            print("&&")
        }
        if ee(lhs: 99 > 0, rhs: 22 < 6){
            print("custom &&")
        }
        
        
        if 99 > 0 || 22 < 6 {
            print("||")
        }
        
        if hh(lhs: 99 > 0, rhs: 22 < 6) {
            print("custom ||")
        }
    }
    
    func logIfTrue(_ predicate:()->Bool) {
        if predicate() {
            print("True")
        }
    }
    
    func logIfTrueAutoClosure(_ predicate:@autoclosure () -> Bool) {
        if predicate() {
            print("autoClosure True")
        }
    }
    
    //柯里化： 是一种量产相似方法的好办法，可以通过柯里化一个方法模板来避免写出很多重复代码，也方便了今后维护。
    func addTo(_ adder: Int) -> (Int) -> Int {
        return {
            num in return num + adder
        }
    }
    

    func greaterThan(_ comparer: Int) -> (Int) -> Bool {
        return { $0 > comparer }
    }
    
    //??的实现
//  ??<T>(optional: T?, defaultValue: @autoclosure () throws -> T) rethrows -> T
    func ww<T>(_ optional: T?, defaultValue: @autoclosure ()-> T) -> T {
        switch optional {
        case .some(let value):
            return value
        case .none:
            return defaultValue()
        }
    }
    

//    &&(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool
    func ee(lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
        if lhs {
            return false
        } else if rhs() {
            return true
        } else {
            return false
        }
    }
    
//    ||(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool
    func hh(lhs: Bool, rhs: @autoclosure () -> Bool) -> Bool {
        if lhs {
            return true
        } else if rhs() {
            return true
        } else {
            return false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

