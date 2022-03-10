//
//  NSDictionary+Extension.swift
//  Diamond Connect
//
//  Created by iMac on 15/06/20.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation
extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}
