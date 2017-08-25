//
//  GCD.swift
//  Tips22
//
//  Created by 李芮 on 17/1/22.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation

typealias Task = (_ cancle: Bool) -> Void

func delay(_ time: TimeInterval, task: @escaping () -> ()) -> Task? {
    
    // 嵌套函数
    func dispatch_later(block: @escaping () -> ()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    
    
    var closure: (() -> Void)? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalColsure = closure {
            if cancel == false {  //如果不取消就执行 task
                DispatchQueue.main.async(execute: internalColsure)
            }
        }
        closure = nil //执行完毕或者取消执行: task = nil
        result = nil
    }
    
    result = delayedClosure
    
    dispatch_later {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    
    return result
    
}

func cancel(_ task: Task?) {
    task?(true)
}
