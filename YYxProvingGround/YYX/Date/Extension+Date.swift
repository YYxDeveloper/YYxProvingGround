//
//  Extension+Date.swift
//  yyxUtilityTestProject
//
//  Created by young lu on 2019/1/13.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
extension Date{
    static func howManyDaysWhen(year:Int,month:Int) -> Int{
        let dateComponents = DateComponents(year: year ,
                                            month: month)
        let date = Calendar.current.date(from: dateComponents)!
        let range = Calendar.current.range(of: .day, in: .month,
                                           for: date)
        return range?.count ?? 0
    }
    static func giveMeUTC0Date(uTC0DateStr:String,dateFormat:String) -> Date? {
        return DateFormatter.giveMeUTC0DateFormatter(dateFormate: dateFormat).date(from: uTC0DateStr)
    }
    static func giveMeCurentDate(currentStr:String,dateFormat:String) ->Date?{
        return DateFormatter.giveMeCurrentFormatter(dateFormate: dateFormat).date(from: currentStr)
    }
}
