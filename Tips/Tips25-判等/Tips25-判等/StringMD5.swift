
//
//  StringMD5.swift
//  Tips25-判等
//
//  Created by 李芮 on 17/2/13.
//  Copyright © 2017年 7feel. All rights reserved.
//

import Foundation

//extension String {
//    var MD5: String {
//        let cString = self.cString(using: String.Encoding.utf8)
//        let length = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
//        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: Int(CC_MD5_DIGEST_LENGTH))
//        
//        CC_MD5(cString!, length, result)
//        
//        return String(format: "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",  result[0], result[1], result[2], result[3],
//                      result[4], result[5], result[6], result[7],
//                      result[8], result[9], result[10], result[11],
//                      result[12], result[13], result[14], result[15])
//    }
//    
//}


extension String {
    var MD5: String {
        var digest = [UInt8](repeatElement(0, count: Int(CC_MD5_DIGEST_LENGTH)))
        if let data = data(using: .utf8) {
            data.withUnsafeBytes({ (bytes: UnsafePointer<UInt8>) -> Void in
                CC_MD5(bytes, CC_LONG(data.count), &digest)
            })
        }
        
        var digestHex = ""
        for index in 0..<Int(CC_MD5_DIGEST_LENGTH) {
            digestHex += String(format: "%02x", digest[index])
        }
        return digestHex
    }
}

extension Double {
    func format(_ f: String) -> String {
        return String(format: "%\(f)f", self)
    }
}
