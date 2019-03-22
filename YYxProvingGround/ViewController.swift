//
//  ViewController.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/3/20.
//  Copyright © 2019年 002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var startStamp = Double()
        
        var lastTimeString = "2019-03-22 09:40:00"
        lastTimeString = lastTimeString.replacingOccurrences(of: "T", with: " ")
        lastTimeString = lastTimeString.replacingOccurrences(of: "Z", with: "")
        
        startStamp =  lastTimeString.convertToDate().convertToStamp()
        
//        let aa = lastTimeString.convertUTC0ToCurrent(dateFormat: DateFormatter.ixFormat).convertToDate().convertToStamp().converStampToString(dateFormat: DateFormatter.ixFormat)
//        let aa = lastTimeString.convertUTC0ToCurrent(dateFormat: DateFormatter.ixFormat)
        
//        print("!!\(aa)")
        let xx = startStamp.convertStampToCurrentString(dateFormat: DateFormatter.ixFormat)
        
        print("???@\(xx)")
        
        let yy = lastTimeString.convertUTC0ToCurrent(dateFormat: DateFormatter.ixFormat)
//        let yy = aa.convertCurrentToUTC0(dateFormat: DateFormatter.ixFormat)
        
        
//        let gg = yy.converStampToUTC0String(dateFormat: DateFormatter.ixFormat)
        
        print(yy)

    }
   

}

