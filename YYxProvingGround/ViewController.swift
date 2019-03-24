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
        dateTest()
        

    }
    func dateTest() {
        let lastTimeString = "2019-03-22 09:40:00"
        
        let yy = lastTimeString.converUTC0DateStringToCurrentDateString(dateFormat: DateFormatter.ixFormat)
        
        let aa = yy.convertCurrentDateStringToUTC0DateString(dateFormat: DateFormatter.ixFormat)
        print(aa)
        
        
        
        print(yy)
       
        
        let xx = yy.convertCurrentDateStringToUTC0Date(witchFormat: DateFormatter.ixFormat)
        print(xx)
        
        
        
        //convert date(utc0) to currentDateString
        let gg = xx.convertUTC0DateToCurrentDateString(dateFormat: DateFormatter.ixFormat)
        print(gg)
        
        let tt = gg.convertCurrentDateStringToUTC0Date(witchFormat: DateFormatter.ixFormat)
        print(tt)
        
        
    }
   
}

