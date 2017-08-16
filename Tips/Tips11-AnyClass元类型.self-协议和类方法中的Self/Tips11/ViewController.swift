//
//  ViewController.swift
//  Tips11
//
//  Created by 李芮 on 17/1/19.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

//MARK: - AnyClass,元类型和.self

//typealias AnyClass = AnyObject.Type

class A {
    class func method() {
        print("Hello")
    }
}


class MusicViewController: UIViewController {
    
}

class AlbumViewController: UIViewController {
    
}

let usingVCTypes:[AnyClass] = [MusicViewController.self, AlbumViewController.self]

func setupViewController(_ vcTypes: [AnyClass]) {
    for vcType in vcTypes {
        if vcType is UIViewController.Type {
            let vc = (vcType as! UIViewController.Type).init()
            print(vc)
        }
    }
}


//接口里的Self

protocol Copyable {
    
    func copy() -> Self
}

class MyClass: Copyable {
    var num = 1
    //该方法要求返回的是一个抽象的、表示当前类型的Self，但是我们返回的是它的真实类型MyClass导致无法编译
//    func copy() -> Self {
//        let result = MyClass()
//        result.num = num
//        return result
//    }
    
    //提示实现的方法和接口中定义的不一样。
//    func copy() -> MyClass {
//        let result = MyClass()
//        result.num = num
//        return result
//        
//    }
    

    //编译器提示如果想构建一个Self类型的对象的话，需要有required关键字修饰的初始化方法，这是因为Swift必须保证当前类和其子类都能响应这个init方法。
    //还有一个解方法是在当前类类的声明前添加final关键字，告诉编译器我们不会再有子类来继承这个类型。
    
    required init() {
        
    }
    
    func copy() -> Self {
        let result = type(of: self).init()
        result.num = num
        return result
        
    }
    
    //另一个使用Self的地方是在类方法中
    
    class func gain() -> Self {
         return self.init()
    }
}


class ClassB: MyClass {
    required init() {
        
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//    .Type 代表的是某个类型的元类型，.Protocol代表某个协议的元类型
//    anyClass 代表任意类型本身
//    .self 用在类型后面取得类型本身，也可以用在某个实例的后面获得这个实例本身
        let typeA: A.Type = A.self
        typeA.method()
        
        
        let anyClass: AnyClass = A.self
        (anyClass as! A.Type).method()
        
        
        setupViewController(usingVCTypes)
        
        
        
        let test = "helLo"
        let interval = "a"..."z"
        
        for c in test.characters {
            if !interval.contains(String(c)) {
                print("\(c)不是小写字母")
            }
        }
        
        
        let object = MyClass()
        object.num = 10
        
        let newObject = object.copy()
        newObject.num = 1
        
        print(object.num)//10
        print(newObject.num)//1
        
        let b = ClassB()
        b.num = 55
        let nb = b.copy()
        print(nb.num)//55
        
        let nb1 = ClassB.gain()
        nb1.num = 100
        print(nb1.num)//100
        
   
        
        let str = String()
        let name = type(of: str)
        debugPrint(name)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

