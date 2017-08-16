//
//  ViewController.swift
//  Tips14
//
//  Created by 李芮 on 17/1/19.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

// MARK: - lazy修饰符和lazy方法
class ClassA {
    lazy var str: String = {
        let str = "Hello"
        print("只在首次访问输出")
        return str
    }()
    
    lazy var name: String = "Hello guys"
    
    lazy var  age: Int = {
        let age = 15
        
        return age
    }()
}

//MARK: - Reflection 和 Mirror

struct Person {
    let name: String
    let age : Int
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let a = ClassA()
        print(a.str)
        print(a.str)
        
        //MARK: - lazy修饰符和lazy方法
        
        let data = 1...3
        
        let result = data.lazy.map { // 优化性能
            (i: Int) -> Int in
            print("正在处理 \(i)")
            return i * 2
        }
        
        print("准备访问结果")
        
        for i in result {
            print("操作后的结果为 \(i)")
        }
        
        print("操作完毕")
        
        let xiaoMing = Person(name: "xiaoMing", age: 16)
        let r = Mirror(reflecting: xiaoMing)
        
        print("xiaoMing 是 \(r.displayStyle!)")
        print("属性个数：\(r.children.count)")
        for child in r.children {
            print("属性名：\(String(describing: child.label)), 值：\(child.value)")
        }
        
        //dump方法通过获取一个对象的镜像并进行标准输出的的方式将其输出来
        dump(xiaoMing)
        //输出
        //    ▿ Tips14.Person
        //    - name: "xiaoMing"
        //    - age: 16
        
        
        
        
        

        if let name = valueFrom(xiaoMing, key: "name") as? String {
            print("通过key得到值：\(name)")
        }
        
        
    }
    
    //实现Object-C中KVC那样的取值
    func valueFrom(_ object:Any, key: String) -> Any? {
        let mirror = Mirror(reflecting: object)
        
        for child in mirror.children {
            let (targetKey, targetMirror) = (child.label, child.value)
            if key == targetKey {
                return targetMirror
            }
            
        }
        return nil
    }


}

