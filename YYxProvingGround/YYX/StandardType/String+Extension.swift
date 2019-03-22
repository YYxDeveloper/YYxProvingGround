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
    func convertToDate() -> Date {
        let ixFormat = "yyyy-MM-dd HH:mm:ss"
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateFormat = ixFormat
        
        return localDateFormatter.date(from: self) ?? Date()
    }
    func convertToDate(witchFormat:String) -> Date {
        let uTCDateFormatter = DateFormatter()
        uTCDateFormatter.dateFormat = witchFormat
        uTCDateFormatter.timeZone = TimeZone.init(identifier: "UTC")
        return uTCDateFormatter.date(from: self) ?? Date()
    }


    func convertUTC0ToCurrent(dateFormat:String) -> String {
        let theStr = self.convertToDate(witchFormat: dateFormat).convertToStamp().convertStampToCurrentString(dateFormat: dateFormat)
        return theStr
    }
}
