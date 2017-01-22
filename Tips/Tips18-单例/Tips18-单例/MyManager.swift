//
//  MyManager.swift
//  Tips18-单例
//
//  Created by 李芮 on 17/1/21.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation

//private 声明的变量或者方法 只能在本文件中访问
//private let sharedInstance = MyManager()

class MyManager {
/*
    class var sharedManager: MyManager {
        
        //在swift1.2之前并不支持存储类型的类属性，所以我们需要使用struct来存储类型变量。
        struct Static {
            static var onceToken: dispatch_once_t = 0
            static var staticInstance: MyManager? = nil
        }
        
        dispatch_once(&Static.onceToken) {
            Static.staticInstance = MyManager()
        }
        return Static.staticInstance!
    }
    
 */
/*
    //使用let 保证线程安全
    class var shareManager: MyManager {
        struct Static {
            static let sharedInstance: MyManager = MyManager()
        }
        return Static.sharedInstance
    }
    
   */

/*
    //swift 1.2 之前最佳实践的做法  使用私有的全局变量
    class var sharedManager: MyManager {
        return sharedInstance
    }
    
 */
    
    //swift 1.2及以后  
    //初始化变量的时候，Apple将会把这个初始化包装在一次swift_once_block_invoke中，以保证它的唯一性。
    //加入私有的初始化方法，来覆盖默认的公开初始化方法，这让项目的其他地方不能通过init来生成自己的MyManager 实例，也保证了类型单例的唯一性。
    
    //如果你需要类似defaultManager的形式的单例（也就是说这个类的使用者可以创建自己的实例）的话，可以去掉这个私有的init方法。
    
    static let sharedManager = MyManager()
    private init() {}
    
    
    func method () {
        print("单例类")
    }
}
