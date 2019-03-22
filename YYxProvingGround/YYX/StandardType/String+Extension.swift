//
//  String+Extension.swift
//  IX
//
//  Created by 002 on 2019/3/7.
//  Copyright © 2019年 IXCG. All rights reserved.
//

import Foundation
extension String{
    func replaceChartTo1Blank(changeChart:String) -> String{
        return self.replacingOccurrences(of: changeChart, with: " ")
    }
    func convertToDateWithIXFormat() -> Date {
        let ixFormat = "yyyy-MM-dd HH:mm:ss"
        let localDateFormatter = DateFormatter()
        localDateFormatter.timeZone = TimeZone.current
        localDateFormatter.dateFormat = ixFormat
        
        return localDateFormatter.date(from: self) ?? Date()
    }
    func convertToDate(witchFormat:String,utcZone:UTCZone) -> Date {
        let uTCDateFormatter = DateFormatter()
        uTCDateFormatter.dateFormat = witchFormat
        uTCDateFormatter.timeZone = TimeZone.init(identifier: utcZone.rawValue)
        return uTCDateFormatter.date(from: self) ?? Date()
    }
    func convertToCurrentDate(dateFormat:String) -> Date {
        
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateFormat = dateFormat
        localDateFormatter.timeZone = TimeZone.current

        
        return localDateFormatter.date(from: self) ?? Date()
    }


    func convertUTC0ToCurrent(dateFormat:String) -> String {
        let theStr = self.convertToDate(witchFormat: dateFormat, utcZone: .zero).convertToStamp().convertStampToCurrentString(dateFormat: dateFormat)
        return theStr
    }
    func convertCurrentToUTC0(dateFormat:String) -> String {
           let theStr = self.convertToCurrentDate(dateFormat: dateFormat).convertToStamp().converStampToString(dateFormat: DateFormatter.ixFormat, utcZone: .zero)
        
        return theStr
    }
}
