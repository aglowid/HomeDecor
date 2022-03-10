//
//  UIColor.swift
//  Diamond Connect
//
//  Created by Maulik Goyani on 05/02/2020.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /**
    Creates an UIColor from HEX String in "#363636" format

    - parameter hexString: HEX String in "#363636" format
    - returns: UIColor from HexString
    */
    convenience init(hexString: String) {
        let str = hexString.replacingOccurrences(of: "#", with: "")
            let hex = str.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    convenience init(hexString: String, alpha: CGFloat) {
        let str = hexString.replacingOccurrences(of: "#", with: "")
            let hex = str.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: alpha / 255)
    }

    
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat = 1) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
    }
    
    public class func randomColor() -> UIColor {
        let r: UInt32 = arc4random_uniform(255)
        let g: UInt32 = arc4random_uniform(255)
        let b: UInt32 = arc4random_uniform(255)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    
    
    public class func randomColorWithLowOpacity() -> UIColor {
        let r: UInt32 = arc4random_uniform(255)
        let g: UInt32 = arc4random_uniform(255)
        let b: UInt32 = arc4random_uniform(255)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 0.5)
    }
    
}

// App Color Code
extension UIColor {
    static var fontColor = UIColor(hexString: "4B4C4E")
    static var bgColor = UIColor(hexString: "F0F1F4")
    static var selectedColor = UIColor(hexString: "4D8AAE")
    static var darkFontColor = UIColor(hexString: "28263D")
    static var statasticTableColor = UIColor(hexString: "EAEEF5")

    
    
    
    
    static var listVieFontColor = UIColor(hexString: "231F20")
    static var placehoderColor = UIColor.init(red: 75.0/225.0, green: 76.0/225.0, blue: 78.0/225.0, alpha: 0.5)
    static var blackTransperntColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.5)
}
