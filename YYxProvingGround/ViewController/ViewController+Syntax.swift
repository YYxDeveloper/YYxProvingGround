//
//  ViewController+Syntax.swift
//  YYxProvingGround
//
//  Created by 呂子揚 on 2019/8/6.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    enum testCase {
        enum reduce {
            case 相加,相乘,字串合併
        }
    }
    func exampleArrayOfReduce(theCase:testCase.reduce) {
        
        switch theCase {
        case testCase.reduce.相加:
            let numbers = [2, 2, 2, 2]
            let numberSum = numbers.reduce(0, { the1, the2 in
                the1 + the2
            })//第一位是0喔
            print(numberSum)//8
        case testCase.reduce.相乘:
            let numbers = [2, 2, 2, 2]
            let numberSum = numbers.reduce(numbers.first, { the1, the2 in
                print("\(the1)&&\(the2)")
               return the1! * the2
            })//迴圈不是照array count it has a start element so need + 1 time,也就是說第一個元素會多做一次自己
            print(numberSum!)//32
        case .字串合併:
            let stringArray = ["Objective-C", "Swift", "HTML", "CSS", "JavaScript"]
            func appendString(string1: String, string2: String) -> String {
                return string1 == "" ? string2 : string1 + "、" + string2
            }
            // reduce方法中的第一个参数是初始值
//            let str = stringArray.reduce("", appendString)
//
//            print(str)
            let secondWaystr = stringArray.reduce("", {
                return $0 == "" ? $1 : $0 + "、" + $1
            })
            print(secondWaystr)
        }
       
    }
}
