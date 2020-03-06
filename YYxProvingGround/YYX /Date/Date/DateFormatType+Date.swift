//
//  DateFormatType+Date.swift
//  YYxProvingGround
//
//  Created by young.lu on 2020/3/6.
//  Copyright © 2020 002. All rights reserved.
//

import Foundation

public enum DateFormatType {
    case year
    case month
    case date
    case dateTime
    case dateTimeSec
    case iso8601DateTimeSec
    case iso8601DateTimeFractionalSec
    case custom(String)

    var stringFormat:String {
        switch self {
        case .year: return "yyyy"
        case .month: return "yyyy-MM"
        case .date: return "yyyy-MM-dd"
        case .dateTime: return "yyyy-MM-dd HH:mm"
        case .dateTimeSec: return "yyyy-MM-dd HH:mm:ss"
        case .iso8601DateTimeSec: return "yyyy-MM-dd'T'HH:mm:ss'Z'"
        case .iso8601DateTimeFractionalSec: return "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        case .custom(let customFormat): return customFormat
        }
    }

    static func == (lhs: DateFormatType, rhs: DateFormatType) -> Bool {
        switch (lhs, rhs) {
        case (.custom(let lhsString), .custom(let rhsString)):
            return lhsString == rhsString

        default:
            return lhs.stringFormat == rhs.stringFormat
        }
    }
}
