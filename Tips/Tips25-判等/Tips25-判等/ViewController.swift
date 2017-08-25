//
//  ViewController.swift
//  Tips25-判等
//
//  Created by 李芮 on 17/2/13.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - 判等 和 哈希
        
        let item1 = ToDoItem(udid: "iOS", title: "Objective-C")
        let item2 = ToDoItem(udid: "iOS", title: "Swift")
        
        
        if item1.isEqual(item2) {
            print("ios")
            print(item2.hashValue)
        }
    
        // MARK: - C 动态库 的使用
        
        print("swifter.tips".MD5)
        // dff88de99ff03d109de22fed4f71a273

        //MARK: - 输出格式化
        
        let a = 3
        let b = 1.3445
        let c  = "Hello"
        print("int: \(a) double: \(b) string: \(c)")
        //int: 3 double: 1.3445 string: Hello
        
        
        let format =   String(format: "%.2f", b)
        print(format)//1.34
        
        
        let f = ".2"
        print("double: \(b.format(f))")
        
        // MARK: - 类簇
        
        let coke = Drinking.drinking(name: "Coke")
        let beer = Drinking.drinking(name: "Beer")
        coke.color // Black
        beer.color // Yellow
        
        
        let cokeClass = NSStringFromClass(type(of: coke))
        let beerClass = NSStringFromClass(type(of: beer))

        print(cokeClass) // Coke
        print(beerClass) // Beer
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class Drinking {
    typealias LiquidColor = UIColor
    var color : LiquidColor {
        return .clear
    }
    
    class func drinking(name: String) -> Drinking {
        var drinking: Drinking
        switch name {
        case "Coke":
            drinking = Coke()
        case "Beer":
            drinking = Beer()
        default:
            drinking = Drinking()
        }
        return drinking
    }
    
}

class Coke: Drinking {
    override var color: Drinking.LiquidColor {
        return .black
    }
}

class Beer: Drinking {
    override var color: Drinking.LiquidColor {
        return .yellow
    }
}







