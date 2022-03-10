//
//  UIFont.swift
//  Bookie
//
//  Created by Nirav Zalavadiya on 23/09/19.
//  Copyright © 2019 Nirav Zalavadiya. All rights reserved.
//

import Foundation
import UIKit


//@IBDesignable extension UIView {
//    override open func awakeFromNib() {
//        self.backgroundColor = .randomColorWithLowOpacity()
//    }
//}

//@IBDesignable extension UITextField {
//    override open func awakeFromNib() {
//        self.backgroundColor = .randomColorWithLowOpacity()
//    }
//}


// for label
@IBDesignable extension UILabel {

    override open func awakeFromNib() {
        super.awakeFromNib()
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            self.font = self.font.withSize(self.font.pointSize - 2)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            self.font = self.font.withSize(self.font.pointSize - 1)
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            self.font = self.font.withSize(self.font.pointSize - 1)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            self.font = self.font.withSize(self.font.pointSize)
        case .iPhone11, .iPhone11Pro, .iPhone11ProMax :
            self.font = self.font.withSize(self.font.pointSize)
        default:
            self.font = self.font.withSize(self.font.pointSize + 0)
        }
        
        
        print("------> \(self.text ?? "")")
        if self.textAlignment == .center { return }
        if self.tag != 100 && self.textAlignment != .center{
//            if UIApplication.isRTL()  {
//                if self.textAlignment == .right {
//                    return
//                }
//            } else {
                if self.textAlignment == .left {
                    return
                }
//            }
        }
        if self.tag != 100 {
//            if UIApplication.isRTL()  {
//                self.textAlignment = .right
//            } else {
                self.textAlignment = .left
//            }
        }
        
        
        return
        if self.textAlignment == .center { return }
        if self.tag != 100 {
//            if UIApplication.isRTL()  {
//                if self.textAlignment == .right {
//                    self.textAlignment = .left
//                    self.tag = 1
//                    return
//                }
//                if self.textAlignment == .left {
//                    self.textAlignment = .right
//                    self.tag = 1
//                    return
//                }
//            } else {
                if self.tag == 1 {
                    if self.textAlignment == .right {
                        self.textAlignment = .left
                        self.tag = 0
                        return
                    }
                    if self.textAlignment == .left {
                        self.textAlignment = .right
                        self.tag = 0
                        return
                    }
//                }
                return
//                if self.textAlignment == .left {
//                    self.textAlignment = .right
//                    return
//                }
            }
        }
        if self.tag != 100 {
//            if UIApplication.isRTL()  {
//                self.textAlignment = .right
//            } else {
                self.textAlignment = .left
//            }
        }
    }

}

//for button
@IBDesignable extension UIButton {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            self.titleLabel?.font = self.titleLabel?.font.withSize((self.titleLabel?.font.pointSize)! - 2)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            self.titleLabel?.font = self.titleLabel?.font.withSize((self.titleLabel?.font.pointSize)! - 1)
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            self.titleLabel?.font = self.titleLabel?.font.withSize((self.titleLabel?.font.pointSize)! - 1)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            self.titleLabel?.font = self.titleLabel?.font.withSize((self.titleLabel?.font.pointSize)!)
            case .iPhone11, .iPhone11Pro, .iPhone11ProMax :
                      self.titleLabel?.font = self.titleLabel?.font.withSize((self.titleLabel?.font.pointSize)!)
        default:
            self.titleLabel?.font = self.titleLabel?.font.withSize((self.titleLabel?.font.pointSize)! + 0)
        }
    }
    
}

//for textfield
@IBDesignable extension UITextField {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            self.font = self.font?.withSize(self.font!.pointSize - 2)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            self.font = self.font?.withSize(self.font!.pointSize - 1)
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            self.font = self.font?.withSize(self.font!.pointSize - 1)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            self.font = self.font?.withSize(self.font!.pointSize)
        case .iPhone11, .iPhone11Pro, .iPhone11ProMax :
            self.font = self.font?.withSize(self.font!.pointSize)
        default:
            self.font = self.font?.withSize(self.font!.pointSize + 0)
        }
    }
}


// for textView
@IBDesignable extension UITextView {
    
    override open func awakeFromNib() {
        super.awakeFromNib()
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            self.font = self.font?.withSize(self.font!.pointSize - 2)
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            self.font = self.font?.withSize(self.font!.pointSize - 1 )
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            self.font = self.font?.withSize(self.font!.pointSize - 1)
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            self.font = self.font?.withSize(self.font!.pointSize + 0)
        case .iPhone11, .iPhone11Pro, .iPhone11ProMax :
            self.font = self.font?.withSize(self.font!.pointSize + 0)
        default:
            self.font = self.font?.withSize(self.font!.pointSize + 0)
        }
    }
}

//for custom value returning
class ClassUIDeviceTypeReturn {
    
    static let shared = ClassUIDeviceTypeReturn()
    
    func returnFloatValue(iPhone5: CGFloat, iPhone6: CGFloat, iPhone6Plus: CGFloat, iPhoneX: CGFloat,iPhone11: CGFloat , iPadDefault: CGFloat) -> CGFloat {
        switch UIDevice().type {
        case .iPhoneSE, .iPhone5, .iPhone5S, .iPhone5C:
            return iPhone5
        case .iPhone6, .iPhone6S, .iPhone7, .iPhone8:
            return iPhone6
        case .iPhone6plus, .iPhone6Splus, .iPhone7plus, .iPhone8plus:
            return iPhone6Plus
        case .iPhoneX, .iPhoneXR, .iPhoneXS, .iPhoneXSMax:
            return iPhoneX
        case .iPhone11, .iPhone11Pro, .iPhone11ProMax :
            return iPhone11
        default:
            return iPadDefault
        }
    }
}

public enum EnumModel: String {
    case simulator     = "simulator/sandbox",
    //iPod
    iPod1              = "iPod 1",
    iPod2              = "iPod 2",
    iPod3              = "iPod 3",
    iPod4              = "iPod 4",
    iPod5              = "iPod 5",
    //iPad
    iPad2              = "iPad 2",
    iPad3              = "iPad 3",
    iPad4              = "iPad 4",
    iPadAir            = "iPad Air ",
    iPadAir2           = "iPad Air 2",
    iPad5              = "iPad 5", //aka iPad 2017
    iPad6              = "iPad 6", //aka iPad 2018
    //iPad mini
    iPadMini           = "iPad Mini",
    iPadMini2          = "iPad Mini 2",
    iPadMini3          = "iPad Mini 3",
    iPadMini4          = "iPad Mini 4",
    //iPad pro
    iPadPro9_7         = "iPad Pro 9.7\"",
    iPadPro10_5        = "iPad Pro 10.5\"",
    iPadPro12_9        = "iPad Pro 12.9\"",
    iPadPro2_12_9      = "iPad Pro 2 12.9\"",
    //iPhone
    iPhone4            = "iPhone 4",
    iPhone4S           = "iPhone 4S",
    iPhone5            = "iPhone 5",
    iPhone5S           = "iPhone 5S",
    iPhone5C           = "iPhone 5C",
    iPhone6            = "iPhone 6",
    iPhone6plus        = "iPhone 6 Plus",
    iPhone6S           = "iPhone 6S",
    iPhone6Splus       = "iPhone 6S Plus",
    iPhoneSE           = "iPhone SE",
    iPhone7            = "iPhone 7",
    iPhone7plus        = "iPhone 7 Plus",
    iPhone8            = "iPhone 8",
    iPhone8plus        = "iPhone 8 Plus",
    iPhoneX            = "iPhone X",
    iPhoneXS           = "iPhone XS",
    iPhoneXSMax        = "iPhone XS Max",
    iPhoneXR           = "iPhone XR",
    iPhone11         = "iPhone 11",
    iPhone11Pro      = "iPhone 11 Pro",
    iPhone11ProMax   = "iPhone 11 Pro Max"

}

// #-#-#-#-#-#-#-#-#-#-#-#-#-#-#
// MARK: UIDevice extensions
// #-#-#-#-#-#-#-#-#-#-#-#-#-#-#

public extension UIDevice {
    var type: EnumModel {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
                
            }
        }
        let modelMap : [ String: EnumModel ] = [
            "i386": .simulator,
            "x86_64": .simulator,
            //iPod
            "iPod1,1": .iPod1,
            "iPod2,1": .iPod2,
            "iPod3,1": .iPod3,
            "iPod4,1": .iPod4,
            "iPod5,1": .iPod5,
            //iPad
            "iPad2,1": .iPad2,
            "iPad2,2": .iPad2,
            "iPad2,3": .iPad2,
            "iPad2,4": .iPad2,
            "iPad3,1": .iPad3,
            "iPad3,2": .iPad3,
            "iPad3,3": .iPad3,
            "iPad3,4": .iPad4,
            "iPad3,5": .iPad4,
            "iPad3,6": .iPad4,
            "iPad4,1": .iPadAir,
            "iPad4,2": .iPadAir,
            "iPad4,3": .iPadAir,
            "iPad5,3": .iPadAir2,
            "iPad5,4": .iPadAir2,
            "iPad6,11": .iPad5, //aka iPad 2017
            "iPad6,12": .iPad5,
            "iPad7,5": .iPad6, //aka iPad 2018
            "iPad7,6": .iPad6,
            //iPad mini
            "iPad2,5": .iPadMini,
            "iPad2,6": .iPadMini,
            "iPad2,7": .iPadMini,
            "iPad4,4": .iPadMini2,
            "iPad4,5": .iPadMini2,
            "iPad4,6": .iPadMini2,
            "iPad4,7": .iPadMini3,
            "iPad4,8": .iPadMini3,
            "iPad4,9": .iPadMini3,
            "iPad5,1": .iPadMini4,
            "iPad5,2": .iPadMini4,
            //iPad pro
            "iPad6,3": .iPadPro9_7,
            "iPad6,4": .iPadPro9_7,
            "iPad7,3": .iPadPro10_5,
            "iPad7,4": .iPadPro10_5,
            "iPad6,7": .iPadPro12_9,
            "iPad6,8": .iPadPro12_9,
            "iPad7,1": .iPadPro2_12_9,
            "iPad7,2": .iPadPro2_12_9,
            //iPhone
            "iPhone3,1": .iPhone4,
            "iPhone3,2": .iPhone4,
            "iPhone3,3": .iPhone4,
            "iPhone4,1": .iPhone4S,
            "iPhone5,1": .iPhone5,
            "iPhone5,2": .iPhone5,
            "iPhone5,3": .iPhone5C,
            "iPhone5,4": .iPhone5C,
            "iPhone6,1": .iPhone5S,
            "iPhone6,2": .iPhone5S,
            "iPhone7,1": .iPhone6plus,
            "iPhone7,2": .iPhone6,
            "iPhone8,1": .iPhone6S,
            "iPhone8,2": .iPhone6Splus,
            "iPhone8,4": .iPhoneSE,
            "iPhone9,1": .iPhone7,
            "iPhone9,3": .iPhone7,
            "iPhone9,2": .iPhone7plus,
            "iPhone9,4": .iPhone7plus,
            "iPhone10,1": .iPhone8,
            "iPhone10,4": .iPhone8,
            "iPhone10,2": .iPhone8plus,
            "iPhone10,5": .iPhone8plus,
            "iPhone10,3": .iPhoneX,
            "iPhone10,6": .iPhoneX,
            "iPhone11,2": .iPhoneXS,
            "iPhone11,4": .iPhoneXSMax,
            "iPhone11,6": .iPhoneXSMax,
            "iPhone11,8": .iPhoneXR,
            "iPhone12,1": .iPhone11,
            "iPhone12,3": .iPhone11Pro,
            "iPhone12,5": .iPhone11ProMax
            
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!] {
            if model == .simulator {
                if let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                    if let simModel = modelMap[String.init(validatingUTF8: simModelCode)!] {
                        return simModel
                    }
                }
            }
            return model
        }
        return EnumModel.iPhone11ProMax
    }
}
