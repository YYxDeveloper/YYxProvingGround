//
//  CookingTimer.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/4/1.
//  Copyright © 2019年 002. All rights reserved.
//

import Foundation
class CookingTimer {
    let sixtyConst = 60
    var isStarted = false
    var theTimer : Timer?
    var second          = 0
    var min             = 0
    var hour            = 0
    
    static let atFirstTimeString = "00:00:00"
    lazy var currentTimeString  = "\(hour.convetToLeadingZeroString()):\(min.convetToLeadingZeroString()):\(second.convetToLeadingZeroString())"
    
    
    func reset() {
        isStarted = false
        theTimer?.invalidate()
        second      = 0
        min         = 0
        hour        = 0
        currentTimeString = CookingTimer.atFirstTimeString
        
    }
    func pause() {
        isStarted = false
        theTimer?.invalidate()
    }
    func start() {
        guard isStarted == false else {return}
        theTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeRepeat(_:)), userInfo: nil, repeats: true)
        isStarted = true
    }
    @objc func timeRepeat(_ time:Timer) -> Void {
        func calculateTime_2(){
            second = second + 1
        }
        func showTheTime_1(){
            currentTimeString =  "\(hour.convetToLeadingZeroString()):\(min.convetToLeadingZeroString()):\(second.convetToLeadingZeroString())"
            print(currentTimeString)
        }
        showTheTime_1()
        calculateTime_2()
        
        
        
    }
    func note() {
        //         //链接：https://www.jianshu.com/p/8fb1f010f3f6
        //        if #available(iOS 10.0, *) {
        //            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
        //
        //                self.countDown()
        //            })
        //        } else {
        //            // Fallback on earlier versions
        //
        //            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        //        }
        
        
    }
}
