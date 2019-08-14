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
    func exampleCaptureList() {
//        https://qiita.com/vc7/items/7cbd642e4059f8c7be10
//        class MYObject: NSObject {
//
//            var text = "my text"
//
//            deinit {
//                // 為了可以清楚有被釋放，所以在釋放時印出字串
//                debugPrint("deinit")
//            }
//
//            func myMethod() {
//                debugPrint("myMethod")
//            }
//
//            // 主角就是這個叫 capture 的 closure ，為了可以存取到 self ，所以加上 lazy 這個前綴
//            lazy var capture: ()->() = {[self.text]
//                print(self.text)
////                self.myMethod()
//            }
//        }
////        var myObject:MYObject? = MYObject()
////        myObject = nil
//
//        var myObject: MYObject? = MYObject()
//        myObject?.capture()
//
//        myObject?.text = "aa"
////        myObject = nil
        /**111111**/
//        var thing = "car"
//        thing = "pp"
//        let closure = {[thing] in
//            print(thing)
//        }
//        thing = "air"
//        print(thing)
//        closure()
    }
    func exampleValueCapture(){
        func makeUselessIncrementer(forIncrement amount: Int) -> Int {
            var runningTotal = 0
            func incrementer() -> Int {
                runningTotal += amount
                return runningTotal
            }
            let a = incrementer()
            
            return a
        }
        func callIncrementByTen(){
            //函式內不是回傳函示沒法value capture
            let incrementByTen = makeUselessIncrementer(forIncrement: 10)
            let a1 = incrementByTen
            
            print(a1)
            // returns a value of 10
            print(incrementByTen)
            // returns a value of 20
            print(incrementByTen)
            // returns a value of 30
        }
        
        func makeIncrementer(forIncrement amount: Int) -> () -> Int {
            var runningTotal = 0
            func incrementer() -> Int {
                runningTotal += amount
                return runningTotal
            }
            return incrementer
        }
        func callMakeIncrementer(){
            let incrementByTen = makeIncrementer(forIncrement: 10)
            print(incrementByTen())
            // returns a value of 10
            print(incrementByTen())
            // returns a value of 20
            print(incrementByTen())
            // returns a value of 30
        }
        callIncrementByTen()
//        callMakeIncrementer()
    }
    // MARK: Array -
    
    func exampleArrayofMapWithEnumerate() {
        let numbers = [7, 8, 9, 10]
        let indexAndNum: [String] = numbers.enumerated().map { (index, element) in
            return "\(index): \(element)"
        }
        print(indexAndNum)
        // ["0: 7", "1: 8", "2: 9", "3: 10"]
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
