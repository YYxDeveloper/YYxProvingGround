//
//  String+Convert.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/3/24.
//  Copyright © 2019年 002. All rights reserved.
//

import Foundation
extension String{
    /**MARK: Convert UTC0DateString/Date
     Tip:什麼時區的時間字串先用該TimeZone將其轉換成正確的DateFormatter
     */
//    func convertUTC0DateStringToUTC0Date(dateFormat:String) ->Date  {
//        let formatter = DateFormatter.giveMeUTC0DateFormatter(dateFormate: dateFormat)
//        return  formatter.date(from: self) ?? Date()
//    }
//    func convertUTC0DateStringToCurrentDateString(dateFormat:String = DateFormatter.ixFormat) -> String {
//        let utc0Date = Date.giveMeUTC0Date(uTC0DateStr: self, dateFormat: DateFormatter.ixFormat)
//        return DateFormatter.giveMeCurrentDateFormatter(dateFormate: dateFormat).string(from: utc0Date)
//    }
}

extension String{
    //MARK: Convert IXFormatDate
    func convertCurrentDateFormatToIXFormatUTP0Date() -> Date {
        let localDateFormatter = DateFormatter.giveMeCurrentDateFormatter(dateFormate: DateFormatter.ixFormat)
        localDateFormatter.dateFormat = DateFormatter.ixFormat
        
        return localDateFormatter.date(from: self) ?? Date()
    }
    func convertToDate() -> Date {
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateFormat = DateFormatter.ixFormat
        
        return localDateFormatter.date(from: self) ?? Date()
    }
    
    //MARK: Convert Current To UTC0
   
//    func convertCurrentDateStringToUTC0DateString(dateFormat:String) -> String {
//        let utc0Date = DateFormatter.giveMeCurrentDateFormatter(dateFormate: dateFormat).date(from: self)
//        return utc0Date!.convertUTC0DateToUTC0DateString(dateFormat:dateFormat)
//    }
//     //MARK: Privat
//    private func convertToUTC0Date(dateFormate:String) -> Date {
//        let uTC0Date = DateFormatter.giveMeUTC0DateFormatter(dateFormate: dateFormate).date(from: self) ?? Date()
//        return uTC0Date
//    }
    
}
