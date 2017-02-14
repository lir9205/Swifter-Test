//
//  ViewController.swift
//  Tips27
//Users/lirui/Desktop/Swifter-Tips/Tips/Tips27/Tips27/ViewController.swift/
//  Created by 李芮 on 17/2/13.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

//错误处理：
//*************  同步API使用异常机制  *************
private var users = ["lirui":"123456","xiaoMing":"111111"]

enum LoginError: ErrorType {
    case UserNotFound, UserPasswordNotMatch
}

func login(user: String, password: String) throws {
    if !users.keys.contains(user) {
        throw LoginError.UserNotFound
    }
    
    if users[user] != password {
        throw LoginError.UserPasswordNotMatch
    }
    
    print("login successfully.")
}

//*************  异步API使用泛型枚举  *************

enum Result<T> {
    case Success(T)
    case Failure(NSError)
}

func doSomethingParam(param:AnyObject) -> Result<String> {
    let success = false
    if success  {
        return Result.Success("成功完成")
    } else {
        let error = NSError(domain: "errorDomain", code: 1, userInfo: nil)
        return Result.Failure(error)
    }
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //*************  同步API使用异常机制  *************
        do {
           try login("lirui", password: "123456")
        } catch LoginError.UserNotFound {
            print("UserNotFound")
        } catch LoginError.UserPasswordNotMatch {
            print("UserPasswordNotMatch")
        } catch {
            //cathch 完枚举的错误以后，要把catch关闭，即最后加入一个空的catch，否则则会报错 Error throw from are not handled because the enclosing catch is not exhaustive  意思就是catch没有关闭
        }
        
        
        //*************  异步API使用泛型枚举  *************
        
        let result = doSomethingParam("http://www.baidu.com")
        
        switch result {
        case let .Success(ok):
            let serverResponse = ok
           print(serverResponse)
        case let .Failure(error):
            let serverResponse = error.description
            print(serverResponse)
        }
        
//        assert(false, "触发断言")
//        assert(false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

