//
//  ViewController.swift
//  Tips8
//
//  Created by 李芮 on 17/1/18.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let swiftInt: Int = 1
        let swiftString: String = "miao"
        
        //使用anyObject不报错是因为 导入了UIKit (其实这里我们需要的是Foundation，而在导入UIKit 的时候也会同时将Foundation导入)，在Swift和Cocoa中的这几个对应的类型是可以进行自动转换的。因为我们显示的声明了需要AnyObject，所以编译器认为我们需要的是Cocoa类型而非原生类型，而帮我们进行了自动的转换。
        var array: [AnyObject] = []
        array.append(swiftInt)
        array.append(swiftString)
        print(array)//[1, miao] array里面的元素最终转化成了NSNumber和NSString
        
        
        //把import UIKit 去掉会报无法适配AnyObject的编译错误，换成Any就对了
        var array1: [Any] = []
        array1.append(swiftInt)
        array1.append(swiftString)
        print(array1)//[1, "miao"]
        
                
    }
    
    func someMethod() -> AnyObject? {
        
        //...
        
        let result: AnyObject? = nil
        
        //返回一个anyObject？，等价于Object-C中返回一个id
        return  result
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

