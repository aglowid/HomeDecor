//
//  NSObject+Extension.swift
//  Diamond Connect
//
//  Created by Maulik Goyani on 16/03/2020.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation
extension NSObject{
    convenience init(jsonStr:String) {
        self.init()

        if let jsonData = jsonStr.data(using: String.Encoding.utf8, allowLossyConversion: false)
        {
            do {
                let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as! [String: AnyObject]

                // Loop
                for (key, value) in json {
                    let keyName = key as String
                    let keyValue: String = value as! String

                    // If property exists
                    if (self.responds(to: NSSelectorFromString(keyName))) {
                        self.setValue(keyValue, forKey: keyName)
                    }
                }

            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
            }
        }
        else
        {
            print("json is of wrong format!")
        }
    }
}
