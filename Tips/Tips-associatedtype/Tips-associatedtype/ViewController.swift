//
//  ViewController.swift
//  Tips-associatedtype
//
//  Created by admin on 2017/8/10.
//  Copyright © 2017年 lirui. All rights reserved.
//

import UIKit

protocol Food {
    
}

struct Meat : Food {}
struct Grass : Food {}


protocol Animal {
    associatedtype F
    func eat(_ food: F)
}

struct Tiger: Animal {
    
    func eat(_ food: Meat) {
        print("eat meat");
    }
}

struct Sheep: Animal {
    func eat(_ food: Grass) {
        print("eat \(food)")
    }
}


func isDangerous<T: Animal>(animal: T) -> Bool {
    if animal is Tiger {
        return true
    }
    else {
        return false
    }
    
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let meat = Meat()
        Tiger().eat(meat)
        
        print(isDangerous(animal: Tiger())) // true
        print(isDangerous(animal: Sheep())) // false
    }

    
}

