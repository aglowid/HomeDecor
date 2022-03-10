//
//  JsonManager.swift
//  Diamond Connect
//
//  Created by Maulik Goyani on 27/02/2020.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation

class JsonManager: NSObject {
    static var shared = JsonManager()
    
    var countryCodes: CountryCodeModel {
        let responseData: CountryCodeModel!
        do {
            let decoder = JSONDecoder()
            responseData = try decoder.decode(CountryCodeModel.self, from: jsonToData(filenName: .CountryCodes))
            return responseData
        } catch {
            responseData = nil
        }
        return responseData
    }
    
    func jsonToData(filenName: JsonFile) -> Data{
        if let path = Bundle.main.path(forResource: filenName.rawValue, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))
                return data
              } catch {
                print(error.localizedDescription)
              }
        }
        return NSData.init() as Data
    }
    
}

enum JsonFile: String {
    case CountryCodes = "CountryCodes"
}

