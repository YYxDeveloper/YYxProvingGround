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
    
    static func convertUTC0DateToLocal(uTC0DateStr:String,dateFormat:String)->String{
        guard let uTC0Date = Date.giveMeUTC0Date(uTC0DateStr: uTC0DateStr, dateFormat: dateFormat) else {
            YYxErrorHandler.printGuardFail() ;return String()
        }
        return DateFormatter.giveMeCurrentFormatter(dateFormate: DateFormatter.ixFormat).string(from: uTC0Date )
    }
}
