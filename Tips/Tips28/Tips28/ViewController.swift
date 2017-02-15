//
//  ViewController.swift
//  Tips28
//
//  Created by 李芮 on 17/2/14.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

enum ImageName: String {
    case myImage = "my_image"
}

enum SegueName: String {
    case mySegue = "my_segue"
}

extension UIImage {
    convenience init!(imageName: ImageName) {
        self.init(named: imageName.rawValue)
    }
}

extension UIViewController {
    func performSegue(withName segueName: SegueName, sender: AnyObject?) {
        performSegueWithIdentifier(segueName.rawValue, sender: sender)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let image = UIImage(imageName:.myImage)
        performSegue(withName: .mySegue, sender: self)
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

