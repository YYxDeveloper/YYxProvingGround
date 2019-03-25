//
//  String+Convert.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/3/24.
//  Copyright © 2019年 002. All rights reserved.
//

import Foundation
extension String{
    
    //MARK: Convert UTC0 To Current
    func convertUTC0DateStringToCurrentDate(dateFormat:String) ->Date  {
        let currentDateString = self.converUTC0DateStringToCurrentDateString(dateFormat: dateFormat)
        return  currentDateString.convertToUTC0Date(dateFormate:  DateFormatter.ixFormat)
    }
    func converUTC0DateStringToCurrentDateString(dateFormat:String) -> String {
        let theStr = self.convertToDate(witchFormat: dateFormat, utcZone: .zero).convertToStamp().convertStampToCurrentString(dateFormat: dateFormat)
        return theStr
    }
    //MARK: Convert IXFormatDate
    func convertToIXFormatDate() -> Date {
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateFormat = DateFormatter.ixFormat
        
        return localDateFormatter.date(from: self) ?? Date()
    }
   
    
    //MARK: Convert Current To UTC0
   
    func convertCurrentDateStringToUTC0DateString(dateFormat:String) -> String {
        let utc0Date = DateFormatter.giveMeCurrentDateFormatter(dateFormate: dateFormat).date(from: self)
        return utc0Date!.convertUTC0DateToUTC0DateString(dateFormat:dateFormat)
    }
     //MARK: Privat
    private func convertToUTC0Date(dateFormate:String) -> Date {
        let uTC0Date = DateFormatter.giveMeUTC0DateFormatter(dateFormate: dateFormate).date(from: self) ?? Date()
        return uTC0Date
    }
    private func convertToDate(witchFormat:String,utcZone:UTCZone) -> Date {
        let uTCDateFormatter = DateFormatter()
        uTCDateFormatter.dateFormat = witchFormat
        uTCDateFormatter.timeZone = TimeZone.init(identifier: utcZone.rawValue)
        return uTCDateFormatter.date(from: self) ?? Date()
    }
}
