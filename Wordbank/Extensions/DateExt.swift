//
//  DateExt.swift
//  Wordbank
//
//  Created by Mahipal Singh on 25/09/26.
//


import Foundation

nonisolated extension Date {
    
    func addingTimeInterval(
        days: Int = 0,
        hours: Int = 0,
        months: Int = 0
    ) -> Date {
        var components = DateComponents()
        components.day = days
        components.hour = hours
        components.month = months
        
        return Calendar.current.date(byAdding: components, to: self) ?? self
    }
}
