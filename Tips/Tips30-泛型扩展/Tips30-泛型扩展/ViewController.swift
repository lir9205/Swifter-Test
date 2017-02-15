//
//  ViewController.swift
//  Tips30-泛型扩展
//
//  Created by 李芮 on 17/2/15.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

extension Array {
    var random: Element? {
        return self.count != 0 ? self[Int(arc4random_uniform(UInt32(self.count)))] : nil
    }
    
    func appendRandomDescription<U: CustomStringConvertible>(input: U) -> String {
        if let element = self.random {
            return "\(element)" + input.description
        } else {
            return "empty array"
        }
    }
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let languages = ["Swift", "ObjC", "C++", "Java"]
        print(languages.random!)
        
        let ranks = [1, 2, 3, 4, 5]
        print(ranks.random!)
        
        
        print(languages.appendRandomDescription(ranks.random!))
        
    }

   


}

