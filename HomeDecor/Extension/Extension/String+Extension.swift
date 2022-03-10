//
//  String+Extension.swift
//  Diamond Connect
//
//  Created by Maulik Goyani on 29/02/2020.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    var isValidUrl: Bool {
        if let url = NSURL(string: self) {
            return UIApplication.shared.canOpenURL(url as URL)
        }
        return false
    }
    
    var hasValidPhone:Bool! {
        get{
            if self.trimmingCharacters(in: .whitespaces).count >= 8, CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: self))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
    
    var eventDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM"
        dateFormatter.timeZone = TimeZone(identifier: "GMT")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self.strToDate ?? Date())
    }
    
    var dob: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        dateFormatter.timeZone = TimeZone(identifier: "GMT")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.string(from: self.strToDate ?? Date())
    }
    
    var strToDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "GMT")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return dateFormatter.date(from: self)
    }
    
    var isNumber: Bool {
        let num = Int(self)
        if num != nil {
            return true
        }
        else {
            return false
        }
    }
    
    var hasEmoji:Bool!{
        get{
            let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+-/*`!@#$%^&*()•€£¥_-+=|?><,.~}{[]:;'\\\" ")
            if self == "" {
                return false
            }
            if self.rangeOfCharacter(from: characterset) != nil {
                return false
            }
            return true
        }
    }
    
    var firstName: String{
        get {
            let strArr = self.components(separatedBy: " ")
            if strArr.count != 0 {
                return strArr[0]
            }
            return ""
        }
    }
    
    var lastName: String{
        get {
            let strArr = self.components(separatedBy: " ")
            if strArr.count >= 2 {
                let lname = self.replacingOccurrences(of: strArr[0], with: "").trimmingCharacters(in: .whitespaces)
                return lname
            }
            return ""

        }
    }
}

extension String {
    
    
    var getDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd MMM"
        if let d = date {
            let dateStr = dateFormatter.string(from: d)
            return dateStr
        } else {
            return ""
        }
    }
    
    var getTaskDateFromApisConverter: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        if let d = date {
          let dateStr = dateFormatter.string(from: d)
          return dateStr
        } else {
          return ""
        }
      }
    
//    var displayTaskDateFromApisConverter: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale
//        let date = dateFormatter.date(from: self)
//        dateFormatter.dateFormat = LocalTimeMange.shared.formatDates
//        if let d = date {
//          let dateStr = dateFormatter.string(from: d)
//          return dateStr
//        } else {
//          return ""
//        }
//      }
//    
//    var displayTaskTimeFromApisConverter: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale
//        let date = dateFormatter.date(from: self)
//        if LocalTimeMange.shared.formatTime == "12 Hours" {
//            dateFormatter.dateFormat = "hh:mm a"
//        } else {
//            dateFormatter.dateFormat = "HH:mm"
//        }
//        if let d = date {
//          let dateStr = dateFormatter.string(from: d)
//          return dateStr
//        } else {
//          return ""
//        }
//      }
    
    var updateDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if let d = date {
            let dateStr = dateFormatter.string(from: d)
            return dateStr
        } else {
            return ""
        }
    }
    
    var url: URL {
        return URL(string: self) ?? URL(string: self.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed) ?? "https://www.google.com") ?? URL(string: "https://www.google.com")!
    }
    
    var trim: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    var isBlank: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var int: Int? {
        return Int(self)
    }
    
    var double: Double? {
        return Double(self)
    }
    
    var float: Float? {
        return Float(self)
    }
    
    var sentenceCase: String {
        if self.trim.count > 0 {
            let splitIndex = index(after: startIndex)
            let firstCharacter = self[..<splitIndex].uppercased()
            let sentence = self[splitIndex...]
            return firstCharacter + sentence
        } else {
            return self
        }
    }
    
    var strikeThrogh: NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
    
    /// Returns the specified number of chars from the left of the string
    /// let str = "Hello"
    /// print(str.left(3))         // Hel
    func left(_ to: Int) -> String {
        return "\(self[..<self.index(startIndex, offsetBy: to)])"
    }
    
    
    //-----------------------------------------------------
    
    /// Returns the specified number of chars from the right of the string
    /// let str = "Hello"
    /// print(str.left(3))         // llo
    func right(_ from: Int) -> String {
        return "\(self[self.index(startIndex, offsetBy: self.count-from)...])"
    }
    
    //-----------------------------------------------------
    
    /// Returns the specified number of chars from the startpoint of the string
    /// let str = "Hello"
    /// print(str.mid(2,amount: 2))         // ll
    func mid(_ from: Int, amount: Int) -> String {
        let x = "\(self[self.index(startIndex, offsetBy: from)...])"
        return x.left(amount)
    }
    
    //-----------------------------------------------------
    
    func sliceByCharacter(from: Character, to: Character) -> String? {
        let fromIndex = self.index(self.firstIndex(of: from)!, offsetBy: 1)
        let toIndex = self.index(self.firstIndex(of: to)!, offsetBy: -1)
        return String(self[fromIndex...toIndex])
    }
    
    //-----------------------------------------------------
    
    func sliceByString(from:String, to:String) -> String? {
        //From - startIndex
        var range = self.range(of: from)
        let subString = String(self[range!.upperBound...])
        
        //To - endIndex
        range = subString.range(of: to)
        return String(subString[..<range!.lowerBound])
    }
    
    //-----------------------------------------------------
    
    static func randomString() -> String {
        return UUID().uuidString.replacingOccurrences(of: "-", with: "")
    }
}

extension NSMutableAttributedString {
    
    @discardableResult func bold(_ text: String, font: UIFont) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: font]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    //----------------------------------------------------------
    
    @discardableResult func underline(_ text: String, font: UIFont) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: font, .underlineStyle: 1]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        
        return self
    }
    
    //----------------------------------------------------------
    
    @discardableResult func normal(_ text: String) -> NSMutableAttributedString {
        let normal = NSAttributedString(string: text)
        append(normal)
        
        return self
    }
    
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
}

extension String {
    var html2AttributedString: NSAttributedString? {
        return Data(utf8).html2AttributedString
    }
    var html2String: String {
        return html2AttributedString?.string ?? ""
    }
    
    var getTheDateObject:Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale
        let date = dateFormatter.date(from: self)
        return date ?? Date()
      }
}


