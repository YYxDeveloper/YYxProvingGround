//
//  DateFormatter+Extension.swift
//  CollectionViewWithStoryboard
//
//  Created by 002 on 2019/3/14.
//  Copyright © 2019年 frank.chen. All rights reserved.
//

import Foundation
extension DateFormatter{
    static let ixFormat = "yyyy-MM-dd HH:mm:ss"
    static func giveMeUTC0DateFormatter(dateFormate:String)->DateFormatter{
        let uTCDateFormatter = DateFormatter()
        uTCDateFormatter.dateFormat = dateFormate
        uTCDateFormatter.timeZone = TimeZone.init(identifier: "UTC")
        return uTCDateFormatter
    }
    static func giveMeCurrentFormatter(dateFormate:String) -> DateFormatter{
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateFormat = dateFormate
        localDateFormatter.timeZone = TimeZone.current
        return localDateFormatter
    }
}
