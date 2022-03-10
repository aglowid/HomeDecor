//
//  DecorObject.swift
//  HomeDecor
//
//  Created by Aglowid on 23/02/22.
//

import Foundation


class DecorObject : NSObject {
    var img : String = ""
    
    override init() {
    }
    
    class func initWithData(img:String) -> DecorObject {
        let obj = DecorObject()
        obj.img = img
        return obj
    }
    
}
