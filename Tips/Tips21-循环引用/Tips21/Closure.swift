//
//  Closure.swift
//  Tips21
//
//  Created by 李芮 on 17/1/22.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation


class Person {
    let name: String
    
    lazy var printName:()->() = {
        [weak self] in        
        if let strongSelf = self {
            print("The name is \(strongSelf.name)")
        }
    }
    
    init(personName: String) {
        name = personName
    }
    
    deinit {
        print("Person deinit \(self.name)")
    }
    
}
