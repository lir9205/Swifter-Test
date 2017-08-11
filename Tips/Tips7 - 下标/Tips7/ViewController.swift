//
//  ViewController.swift
//  Tips7
//
//  Created by 李芮 on 17/1/17.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

extension Array {
    //subscript 下标
    subscript (input:[Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            return result
        }
        
        set {
            for (index, i) in input.enumerated() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
}

struct MyClassContainer1 {
    class MyClass {
        class func hello() {
            print("hello from MyClassContainer1")
        }
    }
}

struct MyClassContainer2 {
    class MyClass {
        class func hello() {
            print("hello from MyClassContainer2")
        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var arr = [1,2,3,4,5]
        arr[[0,2,3]]  = [-1,-3,-4]
        print(arr)
    
        print(sum(1,2,3,4,5))
        
        MyClassContainer1.MyClass.hello()
        MyClassContainer2.MyClass.hello()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sum(_ input: Int...) -> Int {
        return input.reduce(0, +)
    }


}

