//
//  Int+Extension.swift
//  Diamond Connect
//
//  Created by iMac on 03/04/20.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation
extension Int {
    //Training Module
    var videoTime: String {
        get {
            let (h,m,s) = ((self / 3600),(self % 3600) / 60, (self % 3600) % 60)
            if h != 0 {
                return String(format: "%02d:%02d:%02d", h,m,s)
            } else {
                return String(format: "%02d:%02d",m,s)
            }
        }
    }
}

extension Float {
    //Training Module
    var fraction: String {
        get {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 2
//            formatter.locale = Locale(identifier: L102Language.currentAppleLanguage())
            return formatter.string(for: self) ?? "0"
        }
    }
}
