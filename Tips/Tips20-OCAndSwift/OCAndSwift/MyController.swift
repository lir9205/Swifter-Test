//
//  MyController.swift
//  OCAndSwift
//
//  Created by 李芮 on 17/1/21.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation

class MyController: UIViewController {
    override func viewDidLoad() {
        let myView = UIImageView(image: UIImage(named: "1"))
        myView.frame = self.view.bounds
        myView.backgroundColor =  UIColor.red
        self.view.addSubview(myView)
        
        
        let test = MyClass()
        test.logC()
        
        
    }
    
}
