//
//  ViewController.swift
//  Tips9
//
//  Created by 李芮 on 17/1/18.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

//typealias 是单一的，也就是说你必须指定将某个特定的类型通过typealias赋值为新名字，而不能将整个泛型类型进行重命名
typealias Location  =  CGPoint
typealias Distance = Double

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let origin: Location = Location(x: 0, y: 0)
        let point: Location = Location(x:1, y:1)
        
        let distance: Distance = distanceBetweenPoint(origin, toLocation: point)
        
        print(distance)
        
        
    }
    
    func distanceBetweenPoint(location: Location, toLocation: Location) -> Distance {
        let dx = Distance(toLocation.x - location.x)
        let dy = Distance(toLocation.y - location.y)
        
        return sqrt(dx * dx + dy * dy)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

