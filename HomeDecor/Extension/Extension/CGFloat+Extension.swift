//
//  CGFloat+Extension.swift
//  Diamond Connect
//
//  Created by Maulik Goyani on 14/02/2020.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation
import UIKit

extension CGFloat {
    /**
     The relative dimension to the corresponding screen size.
     
     //Usage
     let someView = UIView(frame: CGRect(x: 0, y: 0, width: 375.dp, height: 40.dp)
     
     **Warning** Only works with size references from @1x mockups.
     
     */
    var dp: CGFloat {
        return (self / 375) * UIScreen.main.bounds.width //where 375 is your viewcontroller width where you are making desing
    }
    
    
    func max(_ value : CGFloat) -> CGFloat {
        if self > value {
            return value
        }
        return self
    }
}

extension Float {
    var lastDigit: Double {
        return Double(String(format: "%.2f", ceil(self*100)/100)) ?? Double(self) //(Float(String(format: "%.2f", self)) ?? self)
    }
}
