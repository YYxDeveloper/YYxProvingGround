//
//  Double+Extension.swift
//  IX
//
//  Created by 002 on 2019/2/21.
//  Copyright © 2019年 IXCG. All rights reserved.
//

import Foundation
import UIKit
extension Double{
    var randomRation:Double{
        return Double.random(in: 0...1)
    }
    func convertCGFloat() -> CGFloat {
        return CGFloat(self)
    }
    func convertInt() -> Int {
        return Int(self)
    }
    func converStampToString(dateFormat: String) -> String {
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "GMT" }
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation) //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = dateFormat //Specify your format that you want
        
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    func convertStampToCurrentString(dateFormat: String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateString = DateFormatter.giveMeCurrentDateFormatter(dateFormate: dateFormat).string(from: date)
        
        return dateString
    }
}
