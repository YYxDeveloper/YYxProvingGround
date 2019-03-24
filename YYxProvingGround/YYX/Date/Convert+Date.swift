//
//  Convert+Date.swift
//  IX
//
//  Created by 002 on 2019/2/12.
//  Copyright © 2019年 IXCG. All rights reserved.
//

import Foundation

extension Date {
    enum eachSecond:Int {
        case oneMin     = 60
        case fiveMin    = 300
        case tenMin     = 600
        case fifteenMin = 900
        case thirtyMin  = 1800
        case oneHour    = 3600
        case twoHours   = 7200
        case fourHours  = 14400
        case oneDay     = 86400
        case oneWeek    = 604800
        case oneMonth   = 2629746
        
        
    }
     
    func convertToStamp() -> Double {
        return self.timeIntervalSince1970

    }
    func convertToCurrentDateString(dateFormat:String) -> String {
        return DateFormatter.giveMeCurrentDateFormatter(dateFormate: dateFormat).string(from: self)
    }
    func convertToUTC0DateString(dateFormat:String) -> String {
    return DateFormatter.giveMeUTC0DateFormatter(dateFormate: dateFormat).string(from: self)
    }
    func convertUTC0DateToCurrentDateString(dateFormat:String) -> String {
        
        let currentFormatter = DateFormatter.giveMeCurrentDateFormatter(dateFormate: dateFormat)
        
        return currentFormatter.string(from: self)
    }
    
    
    
}
