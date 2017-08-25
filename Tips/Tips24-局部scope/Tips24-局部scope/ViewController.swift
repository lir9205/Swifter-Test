//
//  ViewController.swift
//  Tips24-局部scope
//
//  Created by 李芮 on 17/2/10.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

//定义一个接受()->()作为函数的全局方法，然后执行它。
func local(_ closure:()->()) {
    closure()
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0,width: 320, height: 480))
        view.backgroundColor = UIColor.white
        
        local {
            let titleLabel = UILabel(frame: CGRect(x: 150, y: 30,width: 200, height: 40))
            titleLabel.textColor = UIColor.red
            titleLabel.text = "Title"
            view.addSubview(titleLabel)
        }
        
        
        local {
            let textLabel = UILabel(frame: CGRect(x: 150, y: 80, width: 200, height: 40))
            textLabel.textColor = UIColor.red
            textLabel.text = "Text"
            view.addSubview(textLabel)
        }
        
        //或者使用匿名闭包隔离代码
        let descLabel: UILabel = {
            let label = UILabel(frame: CGRect(x: 150, y: 200, width: 200, height: 40))
            label.textColor = UIColor.red
            label.text = "Desc"
            return label
        }()
        view.addSubview(descLabel)
        
        self.view = view
    }


}

