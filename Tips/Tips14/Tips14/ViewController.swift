//
//  ViewController.swift
//  Tips14
//
//  Created by 李芮 on 17/1/19.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit


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
        
        
        let xiaoMing = Person(name: "xiaoMing", age: 16)
        let r = Mirror(reflecting: xiaoMing)
        
        print("xiaoMing 是 \(r.displayStyle!)")
        print("属性个数：\(r.children.count)")
        for i in r.children.startIndex..<r.children.endIndex {
            print("属性名：\(r.children[i].0!), 值：\(r.children[i].1)")
        }
        
        //dump方法通过获取一个对象的镜像并进行标准输出的的方式将其输出来
        dump(xiaoMing)
        
        if let name = valueFrom(xiaoMing, key: "name") as? String {
            print("通过key得到值：\(name)")
        }
        
        
    }
    
    //实现Object-C中KVC那样的取值
    func valueFrom(object:Any, key: String) -> Any? {
        let mirror = Mirror(reflecting: object)
        
        for i in mirror.children.startIndex..<mirror.children.endIndex {
            let (targetKey, targetMirror) = mirror.children[i]
            if key == targetKey {
                return targetMirror
            }
            
        }
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

