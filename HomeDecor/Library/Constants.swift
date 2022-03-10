
//
//  Constants.swift
//  Politis
//
//  Created by Dixit Rathod on 06/12/19.
//  Copyright © 2019 Dixit Rathod. All rights reserved.
//

import UIKit
import Foundation

var selectLanguage = "en"
var userType = "admin"

struct errorMsg {
    static let emailFormate = "Please enter valid email address"
}

struct EndPoints {
    //Tasks
    static let signin = "signin"
    static let tasks = "tasks"
    static let completed_tasks = "completed_tasks"
    static let  archieved_tasks = "archieved_tasks"
    
    //TaskList
    static let  task_lists = "task_lists"
    //header
    static let  headers = "headers"
    //Group
    static let  groups = "groups"
    //subTask
    static let  sub_tasks = "sub_tasks"
    
    static let  tags = "tags"
    static let  delete_account = "delete_account"
    static let  user_settings = "user_settings"
    static let user_activity_logs = "user_activity_logs"
    static let signout = "signout"
    static let general_search = "general_search"
}

var cruiseID = ""
extension String {
    var localized: String {
        if L102Language.currentAppleLanguage() == "ar" {
            return NSLocalizedString(self, comment: self)
        }
        else{
            return self
        }
    }
}

