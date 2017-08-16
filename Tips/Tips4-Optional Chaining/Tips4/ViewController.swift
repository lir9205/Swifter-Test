//
//  ViewController.swift
//  Tips4
//
//  Created by 李芮 on 17/1/17.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

class Toy {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Pet {
    var toy: Toy?
}

class Child {
    var pet: Pet?
}

extension Toy {
    func play() {
        print("playing...")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xiaoming = Child()
        let pet = Pet()
        let toy = Toy(name: "tudou")
        pet.toy = toy
        xiaoming.pet = pet
        
//        optional chaining
        let toyName = xiaoming.pet?.toy?.name
        print(toyName)//nil
        
        
        if let toyName = xiaoming.pet?.toy?.name {
            print("小明有宠物，而且宠物有一个玩具名字叫\(toyName)")
            
        } else {
            print("小明没有宠物，或者有宠物但是宠物没有玩具")
        }
        
        
        if let toy = xiaoming.pet?.toy {
            toy.play()
        }else {
            print("no toy")
        }
        
        
        let playClosure = { (child: Child) -> ()? in child.pet?.toy?.play() }
        
        if let _:() = playClosure(xiaoming) {
            print("好开心")
        } else {
            print("不开心，没有玩具可以玩 :(")
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

