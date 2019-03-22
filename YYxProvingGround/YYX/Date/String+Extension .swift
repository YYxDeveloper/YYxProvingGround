//
//  String+Extension.swift
//  IX
//
//  Created by 002 on 2019/3/7.
//  Copyright © 2019年 IXCG. All rights reserved.
//

import Foundation
enum UTCZone:String{
    case UTC8Plus = "UTC+8"
    case UTC
}
extension String{
    func replaceChartTo1Blank(changeChart:String) -> String{
        return self.replacingOccurrences(of: changeChart, with: " ")
    }
    func convertToDate() -> Date {
        let ixFormat = "yyyy-MM-dd HH:mm:ss"
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateFormat = ixFormat
        
        return localDateFormatter.date(from: self) ?? Date()
    }
    func convertToDate(witchFormat:String,uTCZone:UTCZone) -> Date {
        let uTCDateFormatter = DateFormatter()
        uTCDateFormatter.dateFormat = witchFormat
        uTCDateFormatter.timeZone = TimeZone.init(identifier: uTCZone.rawValue)
        return uTCDateFormatter.date(from: self) ?? Date()
    }
   
    func convertUTC0ToCurrent(dateFormat:String)->String{
        guard let uTC0Date = Date.giveMeUTC0Date(uTC0DateStr: self, dateFormat: dateFormat) else {
            YYxErrorHandler.printConvertErrorFail() ;return String()
        }
        return DateFormatter.giveMeCurrentFormatter(dateFormate: dateFormat).string(from: uTC0Date )
    }
//    func converStampToCurrentString(dateFormat: String) -> String {
//        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "GMT" }
//        let date = Date(timeIntervalSince1970: TimeInterval(self))
//
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeZone = TimeZone(abbreviation: localTimeZoneAbbreviation) //Set timezone that you want
//        dateFormatter.locale = NSLocale.current
//        dateFormatter.dateFormat = dateFormat //Specify your format that you want
//
//        let dateString = dateFormatter.string(from: date)
//
//        return dateString
//    }
    func convertCurrentToUTC0(dateFormat:String)->String {
        var localTimeZoneAbbreviation: String { return TimeZone.current.abbreviation() ?? "GMT" }
        
        let date = Date.giveMeCurentDate(currentStr: self, dateFormat: DateFormatter.ixFormat)
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: UTCZone.UTC.rawValue) //Set timezone that you want
        dateFormatter.dateFormat = dateFormat
        //Specify your format that you want
        
        return dateFormatter.string(from: date ?? Date())
    }
   
}
