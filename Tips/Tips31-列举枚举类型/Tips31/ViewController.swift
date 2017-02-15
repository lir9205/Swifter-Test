//
//  ViewController.swift
//  Tips31
//
//  Created by 李芮 on 17/2/15.
//  Copyright © 2017年 7feel. All rights reserved.
//

import UIKit

enum Suit: String {
    case spades = "黑桃"
    case hearts = "红桃"
    case clubs = "梅花"
    case diamonds = "方片"
}

enum Rank: Int, CustomStringConvertible {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    var description: String {
        switch self {
        case .ace:
            return "A"
        case .jack:
            return "J"
        case .queen:
            return "Q"
        case .king:
            return "K"
        default:
            return String(self.rawValue)
        }
    }
}
//使用了一个协议来更好地定义对于所有值的枚举
protocol EnumeratableEnum {
    static var allValues:[Self]{ get }
}

extension Suit: EnumeratableEnum {
    static var allValues: [Suit] {
        return [.spades, .hearts, .clubs, .diamonds]
    }
}

extension Rank: EnumeratableEnum {
    static var allValues: [Rank] {
        return [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine,.ten, .jack, .queen, .king]
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for suit in Suit.allValues {
            for rank in Rank.allValues {
                print("\(suit.rawValue)\(rank)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

