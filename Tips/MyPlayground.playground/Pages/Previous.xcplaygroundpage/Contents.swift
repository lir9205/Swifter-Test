//: Playground - noun: a place where people can play



import UIKit
//:
//:
//:
//:
import XCPlayground
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true//无限制执行


class MyClass {
    @objc func callme() {
        print("Hi")
    }
}

let object = MyClass()

NSTimer.scheduledTimerWithTimeInterval(1, target: object, selector: #selector(MyClass.callme), userInfo: nil, repeats: true)

print("******************")


let url  = NSURL(string: "http://httpbin.org/image/png")!
let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, _, _) in
    let image = UIImage(data: data!)
    XCPlaygroundPage.currentPage.finishExecution()//结束延时执行
}
task.resume()

