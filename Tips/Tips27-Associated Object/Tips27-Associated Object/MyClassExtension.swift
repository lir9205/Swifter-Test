//
//  MyClassExtension.swift
//  Tips27-Associated Object
//
//  Created by 李芮 on 17/2/13.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation


private var key: Void?

extension MyClass {
    var title: String? {
        get {
            return objc_getAssociatedObject(self, &key) as? String
        }
        
        set {
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
