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
        
        // GCD
        
        //创建目标队列
        let workingQueue = dispatch_queue_create("my_queue", nil)
        
        //派发到刚创建的队列中，GCD会负责进行线程调度
        dispatch_async(workingQueue) {
            //在 workingQueue 中异步进行
            print("努力工作")
            //模拟2s的执行时间
            NSThread.sleepForTimeInterval(2)
            
            dispatch_async(dispatch_get_main_queue(), { 
                //返回到主线程更新UI
                print("结束工作，更新UI")
            })
        }
        
        
        
        //延时执行
        
//        let time: NSTimeInterval = 2.0
//        let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(time * Double(NSEC_PER_SEC)))
//        
//        dispatch_after(delay, dispatch_get_main_queue()) { 
//            print("2s后输出")
//        }
        
        
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

