//
//  Date+Extension.swift
//  Diamond Connect
//
//  Created by Maulik Goyani on 28/02/2020.
//  Copyright © 2020 Artoon Solutions. All rights reserved.
//

import Foundation


extension Date {
    
    var bookingDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        dateFormatter.locale = NSLocale(localeIdentifier: "en") as Locale
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    
    var dateStr: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, MMM dd"
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    
    var standerString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "GMT")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let dateStr = dateFormatter.string(from: self)
        return dateStr
    }
    
    var age: Int {
        let now = Date()
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: self, to: now)
        let age = ageComponents.year!
        return age
    }
    
    var add10Year: Date {
        let newDate = Calendar.current.date(byAdding: .year, value: -10, to: Date())
        return newDate!
    }
    
    
    func timeAgoSinceDate(toDate:Date) -> String {

        // From Time
        let fromDate = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        let times = dateFormatter.string(from: fromDate)

        dateFormatter.dateFormat = "MMM d"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        let dates = dateFormatter.string(from: fromDate)

        dateFormatter.dateFormat = "MMM d, yyyy"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        let yearDates = dateFormatter.string(from: fromDate)

       // Year
        if let interval = Calendar.current.dateComponents([.year], from: fromDate, to: toDate).year, interval > 0  {
            return "\(yearDates) at \(times)"
        }

        // Day
        if let interval = Calendar.current.dateComponents([.day], from: fromDate, to: toDate).day, interval > 0  {
            return interval == 1 ? "yesterday at \(times)" : "\(dates) at \(times)"
        }

        // Hours
        if let interval = Calendar.current.dateComponents([.hour], from: fromDate, to: toDate).hour, interval > 0 {
            return "\(interval)" + " " + "hrs"
        }

        // Minute
        if let interval = Calendar.current.dateComponents([.minute], from: fromDate, to: toDate).minute, interval > 0 {
            return "\(interval)" + " " + "min"
        }

        return "just now"
    }
    
    
    /*func timeAgoSinceDate(toDate:Date) -> String {
        
        let startDate = toDate.standerString.strToDate!
        
        // From Time
        let fromDate = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        dateFormatter.timeZone = TimeZone(identifier: "GMT")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let times = dateFormatter.string(from: fromDate)

        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "MMM d"
        dateFormatter2.timeZone = TimeZone(identifier: "GMT")
        dateFormatter2.locale = Locale(identifier: "en_US_POSIX")
        let dates = dateFormatter2.string(from: fromDate)

        let dateFormatter3 = DateFormatter()
        dateFormatter3.dateFormat = "MMM d, yyyy"
        dateFormatter3.timeZone = TimeZone(identifier: "GMT")
        dateFormatter3.locale = Locale(identifier: "en_US_POSIX")
        let yearDates = dateFormatter3.string(from: fromDate)

       // Year
        if let interval = Calendar.current.dateComponents([.year], from: fromDate, to: startDate).year, interval > 0  {
            return "\(yearDates) at \(times)"
        }

        // Day
        if let interval = Calendar.current.dateComponents([.day], from: fromDate, to: startDate).day, interval > 0  {
            return interval == 1 ? "yesterday at \(times)" : "\(dates) at \(times)"
        }

        // Hours
        if let interval = Calendar.current.dateComponents([.hour], from: fromDate, to: startDate).hour, interval > 0 {
            return "\(interval)" + " " + "hrs"
        }

        // Minute
        if let interval = Calendar.current.dateComponents([.minute], from: fromDate, to: startDate).minute, interval > 0 {
            return "\(interval)" + " " + "mins"
        }

        return "just now"
    }*/
}

//extension Date {
//    func formateDate() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = LocalTimeMange.shared.formatDates
//        return dateFormatter.string(from: self)
//    }
//    
//    func formateTime() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = LocalTimeMange.shared.formatTime
//        return dateFormatter.string(from: self)
//    }
//}
