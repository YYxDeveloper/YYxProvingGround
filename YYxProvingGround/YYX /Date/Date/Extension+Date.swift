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
    static func convertUTC0Date(uTC0DateStr:String,dateFormat:String) -> Date {
        return DateFormatter.giveMeGreenwichOriginDateFormatter(dateFormate: dateFormat).date(from: uTC0DateStr) ?? Date()
    }
}

extension Date {
    //https://medium.com/@iosGuaGua6648/ios-date-extension-1a39beda0f44
    init?(fromString string: String, formatType: DateFormatType) {

        guard !string.isEmpty else {
            return nil
        }

        var date: Date?

        switch formatType {
            case .iso8601DateTimeSec, .iso8601DateTimeFractionalSec:
                let dateFormatter = ISO8601DateFormatter.init()
                if formatType == .iso8601DateTimeFractionalSec {
                    dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                }
                date = dateFormatter.date(from: string)

            default:
                let formatter = DateFormatter()
                formatter.dateFormat = formatType.stringFormat
                formatter.timeZone = TimeZone.init(identifier: "UTC")
                date = formatter.date(from: string)
        }

        guard let unwrapDate = date else {
            return nil
        }
        self.init(timeInterval:0, since:unwrapDate)
    }

    func dateToString(formatType: DateFormatType = .date) -> String {
        switch formatType {
            case .iso8601DateTimeSec, .iso8601DateTimeFractionalSec:

                let dateFormatter = ISO8601DateFormatter.init()
                if formatType == .iso8601DateTimeFractionalSec {
                    dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                }
                let stringFormatter = dateFormatter.string(from: self)
                return stringFormatter

            default:
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = formatType.stringFormat
                let stringFormatter = dateFormatter.string(from: self)
                return stringFormatter
        }
    }

    func timeIn24HourFormat() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: self)
    }

    func startOfMonth() -> Date {
        var components = Calendar.current.dateComponents([.year,.month], from: self)
        components.day = 1
        let firstDateOfMonth: Date = Calendar.current.date(from: components)!
        return firstDateOfMonth
    }

    func endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }

    func nextDate() -> Date {
        let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: self)
        return nextDate ?? Date()
    }

    func previousDate() -> Date {
        let previousDate = Calendar.current.date(byAdding: .day, value: -1, to: self)
        return previousDate ?? Date()
    }

    func addMonths(numberOfMonths: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .month, value: numberOfMonths, to: self)
        return endDate ?? Date()
    }

    func removeMonths(numberOfMonths: Int) -> Date {
        let endDate = Calendar.current.date(byAdding: .month, value: -numberOfMonths, to: self)
        return endDate ?? Date()
    }

    //0.Sun. 1.Mon. 2.Thes. 3.Wed. 4.Thur. 5.Fri. 6.Sat.
    func weekDay() -> Int {
        let calendar = Calendar.current.component(.weekday, from: self)
        return calendar - 1
    }

    func countOfDaysInMonth() -> Int {
        let calendar = Calendar.current

        let dateComponents = DateComponents(year: calendar.component(.year, from: self),
                                            month: calendar.component(.month, from: self))
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        return numDays
    }

    func timeSinceDate(fromDate: Date) -> String {
        let earliest = self < fromDate ? self  : fromDate
        let latest = (earliest == self) ? fromDate : self

        let components:DateComponents = Calendar.current.dateComponents([.minute,.hour,.day,.weekOfYear,.month,.year,.second], from: earliest, to: latest)
        let year = components.year  ?? 0
        let month = components.month  ?? 0
        let week = components.weekOfYear  ?? 0
        let day = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0

        if year >= 2{
            return "\(year) years ago"
        }else if (year >= 1){
            return "1 year ago"
        }else if (month >= 2) {
             return "\(month) months ago"
        }else if (month >= 1) {
         return "1 month ago"
        }else  if (week >= 2) {
            return "\(week) weeks ago"
        } else if (week >= 1){
            return "1 week ago"
        } else if (day >= 2) {
            return "\(day) days ago"
        } else if (day >= 1){
           return "1 day ago"
        } else if (hours >= 2) {
            return "\(hours) hours ago"
        } else if (hours >= 1){
            return "1 hour ago"
        } else if (minutes >= 2) {
            return "\(minutes) minutes ago"
        } else if (minutes >= 1){
            return "1 minute ago"
        } else if (seconds >= 3) {
            return "\(seconds) seconds ago"
        } else {
            return "Just now"
        }
    }
}
