//
//  String+Convert.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/3/24.
//  Copyright © 2019年 002. All rights reserved.
//

import Foundation
extension String{
    func convertToCurrentDate() -> Date {
        let currentString = self.convertToGreenwichStamp().convertStampToCurrentString(dateFormat: DateFormatter.defaultFormat)
        let formatter = DateFormatter.giveMeGreenwichOriginDateFormatter(dateFormate: DateFormatter.defaultFormat)
        return formatter.date(from: currentString) ?? Date()
    }
}

extension String{
    //MARK: Convert IXFormatDate
    func convertCurrentDateFormatToIXFormatUTP0Date() -> Date {
        let localDateFormatter = DateFormatter.giveMeCurrentDateFormatter(dateFormate: DateFormatter.defaultFormat)
        localDateFormatter.dateFormat = DateFormatter.defaultFormat
        
        return localDateFormatter.date(from: self) ?? Date()
    }

}
