//
//  UITextField+Extension.swift
//  Diamond Connect
//
//  Created by Maulik Goyani on 14/02/2020.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation
import UIKit


extension UITextField{
    
    func placeholderColor(_ color: UIColor){
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: color])
    }
    
    func plachoderFontName(_ fontName: String){
        let attributes = [ NSAttributedString.Key.font : UIFont(name: fontName, size: self.font!.pointSize)! ]
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes:attributes)
    }
    
    var hasValidPhone:Bool! {
        get{
            if self.text?.trimmingCharacters(in: .whitespaces).count ?? 0 >= 8, CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self.text!))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
    
    var isWhiteSpaceCheck:Bool! {
        get {
            return self.text?.rangeOfCharacter(from: .whitespacesAndNewlines) != nil
        }
    }
    
    var isEmpty:Bool!{
        get{
            if self.text!.trimmingCharacters(in: .whitespaces).count == 0
            {
                return true
            }
            else
            {
                return false
            }
        }
    }
    
    var hasAlphabets:Bool{
        get{
            for chr in self.text!{
                if ((chr >= "a" && chr <= "z") || (chr >= "A" && chr <= "Z") ) {
                    return true
                }
            }
            return false
            
        }
    }
    
    var isValidName: Bool {
        let RegEx = "^[a-zA-Z0-9 \\_]{2,25}$"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: self.text)
    }
    
    var hasValidEmail:Bool!{
        get{
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            return emailTest.evaluate(with: self.text!)
        }
    }
    
    /*var hasValidPhoneNumber: Bool {
        get {
            let PHONE_REGEX = "^\\d{10}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
            let result =  phoneTest.evaluate(with: self.text)
            return result
        }
    }*/

    
    var hasValidPassword:Bool!{
        get{
            return self.text!.count >= 3
        }
    }
    
    
    
    
}
