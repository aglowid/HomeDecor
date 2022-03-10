//
//  Error+Extension.swift
//  Diamond Connect
//
//  Created by iMac on 03/04/20.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation

extension Error {
    var code: Int { return (self as NSError).code }
    var domain: String { return (self as NSError).domain }
}
