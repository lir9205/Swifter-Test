//
//  ViewController.swift
//  Tips21 -UnsafePointer和C指针内存管理
//
//  Created by admin on 2017/8/23.
//  Copyright © 2017年 lirui. All rights reserved.
//

import UIKit


class MyClass {
    var a = 1
    deinit {
        print("deinit")
    }
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - UnsafePointer
        
        var a: CInt = 4
        method(&a)
        
        let arr = NSArray(object: "meow")
        // unsafeBitCast 将第一个参数的内容按照第二个参数的类型进行转换
        let str = unsafeBitCast(CFArrayGetValueAtIndex(arr, 0), to: CFString.self)
        print(str) //str = meow
        
        // MARK: - C 指针内存管理
        var pointer: UnsafeMutablePointer<MyClass>!
        pointer = UnsafeMutablePointer<MyClass>.allocate(capacity: 1)
        pointer.initialize(to: MyClass())

        print(pointer.pointee.a) //1

        pointer.deinitialize()
        pointer.deallocate(capacity: 1)
        pointer = nil
        
        var x: UnsafeMutablePointer<tm>!
        var t = time_t()
        time(&t)
        x = localtime(&t)
        x = nil
        
        
        let callback:@convention(c)(Int32, Int32) -> Int32 = {
            (x, y) -> Int32 in
            return x + y
        }
        
        let result = cFunction(callback)
        print(result)// 3
        
        
        let result1 = cFunction { (x, y) -> Int32 in
            return x * y
        }
        print(result1)
        //
        
        
        
    }
    
    
    func method(_ num: UnsafePointer<CInt>) {
        print(num.pointee)
    }
    

}



