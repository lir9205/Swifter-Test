//
//  ViewController.swift
//  Tips3
//
//  Created by 李芮 on 17/1/16.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit


class ReverseGenerator<T>: GeneratorType {
    typealias Element = T
    
    var array:[Element]
    var currentIndex = 0
    
    init(array:[Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> Element? {
        if currentIndex < 0 {
            return nil
        }
        else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
            
        }
    }
    
}


struct ReverseSequence<T>: SequenceType {
    var array:[T]
    
    init(array:[T]){
        self.array = array
    }
    
    typealias Generator = ReverseGenerator<T>
    func generate() -> Generator {
        return ReverseGenerator(array: self.array)
    }
    
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let arr = [0,1,2,3,4]
        let reduceValue = 20
        
        
        for i in ReverseSequence(array: arr) {
            print("index \(i) is \(arr[i])")
        }
        
        let mapArr = ReverseSequence(array: arr).map { $0 * 10}
        print(mapArr)
        
        let filterArr = ReverseSequence(array: arr).filter { $0 % 2 == 0}
        print(filterArr)
        
        print(ReverseSequence(array: arr).reduce(reduceValue, combine: { $0 + $1 }))
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

