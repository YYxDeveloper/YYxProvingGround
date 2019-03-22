//
//  Double+Extension.swift
//  IX
//
//  Created by 002 on 2019/2/21.
//  Copyright © 2019年 IXCG. All rights reserved.
//

import Foundation
import UIKit
enum UTCZone:String{
    case zero = "UTC"
    case plus8 = "UTC+8"
}
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
    func convertStampToCurrentString(dateFormat: String) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = Date.currentTimezone//Set timezone that you want
        dateFormatter.dateFormat = dateFormat //Specify your format that you want
        dateFormatter.locale = NSLocale.current

        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    func converStampToString(dateFormat: String,utcZone:UTCZone) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: utcZone.rawValue) //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = dateFormat //Specify your format that you want
        
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
   
}
