//
//  ViewController.swift
//  Tips22
//
//  Created by 李芮 on 17/1/22.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  MARK: - GCD
        // 创建目标队列
        let workingQueue = DispatchQueue(label: "MyQueue")
        
        // 派发到刚创建的队列中
        workingQueue.async {
            // 在 workingQueue 中异步进行
            print("努力工作")
            Thread.sleep(forTimeInterval: 2) //模拟两秒的执行时间
            
            DispatchQueue.main.async {
                // 返回到主线程更新 UI
                print("结束工作, 更新 UI")
            }
        }
        
        //  MARK: - 延时调用
        let time: TimeInterval = 2.0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            print("2 秒后输出")
        }
        
        
        //使用封装之后的方法
        
        
        delay(2) { 
            print("2s后输出")
        }
        
        
        let task = delay(5) {
            print("拨打 110")
        }
        //仔细想想还是取消为妙
        cancel(task)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

