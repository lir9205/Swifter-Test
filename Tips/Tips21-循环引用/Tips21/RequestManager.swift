//
//  RequestManager.swift
//  Tips21
//
//  Created by 李芮 on 17/1/22.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation

class RequestManager : RequestHandler {
    @objc func requestFinished() {
        print("请求完成")
    }
    
    func sendRequest() {
        let req = Request()
        req.delegate = self
        req.send()
    }
    
    deinit {
        print("RequestManager deinit")
    }
}