//
//  ViewController.swift
//  Tips13
//
//  Created by 李芮 on 17/1/19.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit



//MARK: - 动态类型和多方法

class Pet {}
class Cat: Pet {}
class Dog: Pet {}


func printPet(_ pet: Pet) {
    print("Pet")
}

func printPet(_ cat: Cat) {
    print("Cat")
}

func printPet(_ dog: Dog) {
    print("Dog")
}

//func printThem(_ pet: Pet, _ cat: Cat) {
//    printPet(pet)
//    printPet(cat)
//}

func printThem(_ pet: Pet, _ cat: Cat) {
    if let aCat = pet as? Cat {
        printPet(aCat)
    } else if let aDog = pet as? Dog {
        printPet(aDog)
    }
    printPet(cat)
}

//MARK: - 属性观察

class A {
    var number: Int {
        get {
            print("get")
            return 1
        }
        set {
            print("set")
        }
    }
}

class B: A {
    override var number: Int {
        willSet {
            print("willSet")
        }
        
        didSet {
            print("didSet")
        }
    }
}

//MARK: - final

class Parent {
    final func method() {
        print("开始配置")
        //...必要的代码
        
        methodImpl()
        
        //...必要的代码
        print("结束配置")
    }
    
    func methodImpl() {
        fatalError("子类必须实现这个方法")
        // 或者也可以给出默认实现
    }
}

class Child: Parent {
    override func methodImpl() {
        print("子类的业务逻辑。。。")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let child = Child()
        child.method()
        
        printPet(Cat())  // Cat
        printPet(Dog())  // Dog
        printPet(Pet())  // Pet
        
        //printThem(Dog(), Cat()) // Pet Cat
        
        printThem(Dog(), Cat()) // Dog Cat
        
        let typeChild: Child.Type = Child.self;
        
        if type(of: child) == typeChild {
            print("this is a child")
        }
        
        let b = B()
        b.number = 0
        
//        get
//        willSet
//        set
//        didSet
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

