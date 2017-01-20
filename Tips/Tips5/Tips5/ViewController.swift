//
//  ViewController.swift
//  Tips5
//
//  Created by 李芮 on 17/1/17.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

struct Vector2D {
    var x = 0.0
    var y = 0.0
}

//swift 中的操作符不能定义在局部域中。infix 定义的是中位操作符，两边都是输入。prefix，单目运算符且运算符在操作数前面；
//postfix,单目运算符且操作数在操作数右边。
func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

func - (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x - right.x, y: left.y - right.y)
}

prefix func - (value: Vector2D) -> Vector2D {
    return Vector2D(x: -value.x, y: -value.y)
}

postfix func ++ (inout value: Vector2D) -> Vector2D {
    value.x += 1;
    value.y += 1;
    return Vector2D(x: value.x, y: value.y)
}

prefix func ++ (inout value: Vector2D) -> Vector2D {
    let rawValue = value
    
    value.x += 1;
    value.y += 1;
    
    return Vector2D (x: rawValue.x, y: rawValue.y)
    
}

infix operator +* {
    associativity none //结合律 left right none
    precedence 160 //运算的优先级，乘法和除法的优先级是150，加法和减法的优先级是140
}

func +*(left: Vector2D, right: Vector2D) -> Double {
    return left.x * right.x + left.y * right.y
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let v1 = Vector2D(x: 2.0, y: 3.0)
        let v2 = Vector2D(x: 1.0, y: 4.0)
        
        var v3 = -v1 + v2
        let v4 = ++v3
        
        print(v3)
        print(v4)
        
        print(v1 +* v2)
        
        let addNumber2 = makeIncrementor(3)
        var a = 3
        
        
        addNumber2(&a)
        
    }
    
    //嵌套的函数，里层和外层的参数的修饰词需保持一致
    func makeIncrementor(addNumber: Int) -> ((inout Int) -> ()) {
        func incrementor(inout variable: Int) -> () {
            variable += addNumber
        }
        return incrementor
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

