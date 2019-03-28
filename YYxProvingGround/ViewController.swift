//
//  ViewController.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/3/20.
//  Copyright © 2019年 002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let dateFomat = DateFormatter.ixFormat
    @IBOutlet weak var sliderView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

//        ee()
//        gg()
//        let aa = 1553247600.0
//        let gg = aa.converGreenwichStampToString()
//        print(gg)
//        uu()
        
        addHorizontalSliderWithHeigh50(toWitchView: sliderView)
        
    }
    func tt()  {
        
    }
    func uu() {
        var date:NSDate = NSDate()
        // 设置系统时区为本地时区
        let zone = TimeZone.autoupdatingCurrent
        // 计算本地时区与 GMT 时区的时间差
        let second:Int = zone.secondsFromGMT()
        // 在 GMT 时间基础上追加时间差值，得到本地时间
        date = date.addingTimeInterval(TimeInterval(second))
        
        
    }
    func ee()  {
         let utc0String = "2019-03-22 09:40:00"
       print(utc0String.convertToGreenwichStamp().converGreenwichStampToString())
        
    }
    func gg()  {
         let utc0String = "2019-03-22 17:40:00"
        let yyxDate = GreenwichDateConverter.init(initDateString: utc0String, format: DateFormatter.ixFormat, initTimeZone: .current)
    
    }
    
   

}
