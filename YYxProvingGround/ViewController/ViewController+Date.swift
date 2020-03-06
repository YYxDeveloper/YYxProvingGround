//
//  ViewController+Date.swift
//  YYxProvingGround
//
//  Created by young.lu on 2020/3/6.
//  Copyright © 2020 002. All rights reserved.
//

import Foundation
extension ViewController{
    func exampleDateAppend1Day() {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd ZZZZ"
        
        let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: date)
        print("nextDate without DateFormatter\(nextDate!)")
        let todayString = dateFormatter.string(from: date)
        print(todayString)
        let tomorrowDayString = dateFormatter.string(from: nextDate!)
        print(tomorrowDayString)
    }
}
