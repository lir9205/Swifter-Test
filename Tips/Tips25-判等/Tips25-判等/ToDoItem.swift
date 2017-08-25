//
//  ToDoItem.swift
//  Tips25-判等
//
//  Created by 李芮 on 17/2/13.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation

//swift实现判等(NSObject的子类)的两个方法：
//1. 实现Equatable协议，重写 == 运算符
//2. 重写isEqual:方法

//如果在Objective-C中使用这个类的话，只能使用第二种方式，因为Objective-C不支持运算符重载。
//非NSObject的子类只能使用第一种方法。
//swift使用 === 运算符来判断两个AnyObject是否是同一个引用。

class ToDoItem {
    let udid: String
    var title: String
    
    init(udid: String, title: String) {
        self.udid = udid
        self.title = title
    }
    
    
    func isEqual(_ item: ToDoItem) -> Bool {
        return self.udid == item.udid
    }
    
}

extension ToDoItem: Equatable {
    
}

func ==(lhs: ToDoItem,rhs: ToDoItem) -> Bool {
    return lhs.udid == rhs.udid
}

//在重写哈希方法时候所采用的策略,与判等的时候是类似的:对于非 NSObject 的类,我们需要遵守 Hashable 并根据 == 操作符的内容给出哈希算法;而对于 NSObject 子类,需要根据是否 需要在 Objective-C 中访问而选择合适的重写方式,去实现 Hashable 的 hashValue 或者直接重写 NSObject 的 -hash 方法。

extension ToDoItem: Hashable {
    var hashValue: Int { return self.udid.characters.count }
}

