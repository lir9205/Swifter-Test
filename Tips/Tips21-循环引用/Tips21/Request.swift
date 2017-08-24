//
//  Request.swift
//  Tips21
//
//  Created by 李芮 on 17/1/22.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation


@objc protocol RequestHandler {
    @objc optional func requestFinished()
}

class Request {
    weak var delegate: RequestManager!
    
    func send() {
        print("发送请求，一般来说会将req的引用传递给网络框架")
        gotResponse()
    }
    
    func gotResponse() {
        print("请求返回")
        delegate?.requestFinished()
    }
    
    deinit {
        print("request deinit")
    }
}
