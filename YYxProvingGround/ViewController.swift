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
        
        let currentDateString = lastTimeString.converUTC0DateStringToCurrentDateString(dateFormat: DateFormatter.ixFormat)
        print(currentDateString)
        
        let aaa = currentDateString.convertToUTC0Date(dateFormate:  DateFormatter.ixFormat)
        
        print(aaa)
        
        
        
        let bb = lastTimeString.convertToUTC0Date(dateFormate: DateFormatter.ixFormat)
        print(bb)
        

        let utc0DateString = currentDateString.convertCurrentDateStringToUTC0DateString(dateFormat: DateFormatter.ixFormat)
        print(utc0DateString)
        
        
        
       
        
        let utcDate = currentDateString.convertCurrentDateStringToUTC0Date(witchFormat: DateFormatter.ixFormat)
        print(utcDate)
        
        
        
        //convert date(utc0) to currentDateString
        let currentDateString2 = utcDate.convertUTC0DateToCurrentDateString(dateFormat: DateFormatter.ixFormat)
        print(currentDateString2)
        
        let utc0Date2 = currentDateString.convertCurrentDateStringToUTC0Date(witchFormat: DateFormatter.ixFormat)
        print(utc0Date2)
        
        
    }
   
}

