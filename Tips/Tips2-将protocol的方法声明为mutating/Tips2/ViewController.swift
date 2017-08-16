//
//  ViewController.swift
//  Tips2
//
//  Created by 李芮 on 17/1/16.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

protocol Vehicle {
    var numberOfWheels:Int {get}
    var color: UIColor { get set }
    
    mutating func changeColor()
}

struct MyCar: Vehicle {
    let numberOfWheels: Int = 4
    var color: UIColor = UIColor.blue
    
    mutating func changeColor() {
        color = UIColor.red
    }
    
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

