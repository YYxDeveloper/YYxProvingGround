//
//  String+Convert.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/3/24.
//  Copyright © 2019年 002. All rights reserved.
//

import Foundation
extension String{
    func convertToIXFormatDate() -> Date {
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateFormat = DateFormatter.ixFormat
        
        return localDateFormatter.date(from: self) ?? Date()
    }
    func convertUTC0DateStringToCurrentDate(witchFormat:String) -> Date {
        let currentDate = self.convertTOCurrentDate(dateFormate:witchFormat )
        let utc0String = currentDate.convertToCurrentDateString(dateFormat: witchFormat)
        let uTCD0teFormatter = DateFormatter.giveMeCurrentDateFormatter(dateFormate: witchFormat)
        let utc0Date = uTCD0teFormatter.date(from: utc0String) ?? Date()
        return utc0Date
    }
    func convertCurrentDateStringToUTC0Date(witchFormat:String) -> Date {
        let currentDate = self.convertTOCurrentDate(dateFormate: witchFormat)
        let currentString = currentDate.convertToUTC0DateString(dateFormat: witchFormat)
        let uTCDateFormatter = DateFormatter()
        uTCDateFormatter.dateFormat = witchFormat
        uTCDateFormatter.timeZone = TimeZone.init(identifier: UTCZone.zero.rawValue)
        return uTCDateFormatter.date(from: currentString) ?? Date()
        
        
    }
    func converUTC0DateStringToCurrentDateString(dateFormat:String) -> String {
        let theStr = self.convertToDate(witchFormat: dateFormat, utcZone: .zero).convertToStamp().convertStampToCurrentString(dateFormat: dateFormat)
        return theStr
    }
    func convertCurrentDateStringToUTC0DateString(dateFormat:String) -> String {
        let utc0Date = DateFormatter.giveMeCurrentDateFormatter(dateFormate: dateFormat).date(from: self)
        return utc0Date!.convertToUTC0DateString(dateFormat:dateFormat)
    }
    func convertToUTC0Date(dateFormate:String) -> Date {
        let uTC0Date = DateFormatter.giveMeUTC0DateFormatter(dateFormate: dateFormate).date(from: self) ?? Date()
        return uTC0Date
    }
    func convertTOCurrentDate(dateFormate:String) -> Date {
        let currentDate = DateFormatter.giveMeCurrentDateFormatter(dateFormate: dateFormate).date(from: self) ?? Date()
        return currentDate
    }
    func convertToDate(witchFormat:String,utcZone:UTCZone) -> Date {
        
        let uTCDateFormatter = DateFormatter()
        uTCDateFormatter.dateFormat = witchFormat
        uTCDateFormatter.timeZone = TimeZone.init(identifier: utcZone.rawValue)
        return uTCDateFormatter.date(from: self) ?? Date()
    }
}
