//
//  UIViewController+Extension.swift
//  Diamond Connect
//
//  Created by iMac on 23/03/20.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    
//    open override func awakeFromNib() {
//        self.view.backgroundColor = UIColor.init(hexString: "EAEEF5")
//    }
    
    /*open override func awakeFromNib() {
        /*if self.navigationController?.interactivePopGestureRecognizer != nil {
            if self is DashboardViewController {
                self.navigationController?.interactivePopGestureRecognizer!.isEnabled = true
            } else {
                self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false
            }
        }*/
    }*/
    
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    var topSafeArea: CGFloat? {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.top
        } else {
            return topLayoutGuide.length
        }
    }
    
    var bottomSafeArea: CGFloat? {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.bottom
        } else {
            return bottomLayoutGuide.length
        }
    }
    
}


