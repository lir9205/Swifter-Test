//
//  ViewController.swift
//  Tips19-条件编译
//
//  Created by 李芮 on 17/1/21.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

//#define FREE_VERSION

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//   平台  os(OSX) os(iOS)
//   cpu  模拟器32位和64位 arch(i386) arch(x86_64)
//        真机32位和64位 arch(arm) arch(arm64)
        #if os(OSX)
            typealias Color = NSColor
        #elseif arch(i386)
            typealias Color = UIColor
        #else
            typealias Color = UIColor
        #endif
        
        
        MyClass.log()
        
    
    
    
    }
    
    //编译标记
    //MARK: - 标记代码区间
    //TODO: 还未完成的工作
    //FIXME: 需要修正的地方

    @IBAction func buttonClicked(sender: UIButton) {
    //为了使 FREE_VERSION 有效，我们需要在项目的编译选项中进行设置，
    // bulid setting -> Swift Compiler -> custom flags -> other swift flags ->  -D FREE_VERSION

        #if FREE_VERSION
            print("弹出购买提示，导航至商店等")
        #else
            print("实际功能")
        #endif
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

