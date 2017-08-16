//
//  MyManager.swift
//  Tips18-单例
//
//  Created by 李芮 on 17/1/21.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation

//fileprivate 声明的变量或者方法 只能在本文件中访问
fileprivate let sharedInstance = MyManager()

class MyManager {
/*  1 因为在Swift中可以无缝直接使用 GCD， 所以我们可以很方便的把 OC 实现单例的方式用Swift改写：
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
    
/*  2 使用let 保证线程安全
    class var shareManager: MyManager {
        struct Static {
            static let sharedInstance: MyManager = MyManager()
        }
        return Static.sharedInstance
    }
    
   */
   /*3
     //swift 1.2 之前最佳实践的做法。由于Swift 1.2 之前 `class` 不支持存储式的 `property`，我们想要使用一个只存在一份的属性时，就只能将其定义在全局的 scope 中。值得庆幸的是，在 Swift 中是有访问级别的控制的，我们可以在变量定义前面加上 `private` 关键字，使这个变量只在当前文件中可以被访问。这样我们就可以写出一个没有嵌套的，语法上也更简单好看的单例了:使用私有的全局变量
    class var sharedManager: MyManager {
        return sharedInstance
    }
 */

    // 4
    //swift 1.2及以后  可以在 class 中使用 static 来声明一个类型作用域的变量。
    //初始化变量的时候，Apple将会把这个初始化包装在一次swift_once_block_invoke中，以保证它的唯一性。对于所有的全局变量，Apple都会在底层使用这个类似 `dispatch_once` 的方式来确保只以lazy的方式初始化一次。
    //另外，我们在这个类型中加入了一个私有的初始化方法，来覆盖默认的公开初始化方法，这让项目的其他地方不能通过init来生成自己的MyManager 实例，也保证了类型单例的唯一性。
    
    //如果你需要类似defaultManager的形式的单例（也就是说这个类的使用者可以创建自己的实例）的话，可以去掉这个私有的init方法。
    
    static let sharedManager = MyManager()
    fileprivate init() {}
    
    
    func method () {
        print("单例类")
    }
}
