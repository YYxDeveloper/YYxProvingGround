//
//  String+Extension.swift
//  IX
//
//  Created by 002 on 2019/3/7.
//  Copyright © 2019年 IXCG. All rights reserved.
//

import Foundation
enum UTCZone:String{
    case zero = "UTC"
    case plus8 = "UTC+8"
}
extension String{
    func replaceChartTo1Blank(changeChart:String) -> String{
        return self.replacingOccurrences(of: changeChart, with: " ")
    }
}
