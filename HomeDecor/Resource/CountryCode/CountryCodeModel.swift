//
//  CountryCodeModel.swift
//  Diamond Connect
//
//  Created by Maulik Goyani on 19/03/2020.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation

struct CountryCodeModel : Codable {
    let country : [Country]?
    struct Country : Codable {
        let code : String?
        let dial_code : String?
        let name : String?
    }
}
