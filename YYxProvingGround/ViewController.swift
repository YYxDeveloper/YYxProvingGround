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
    override func viewDidLoad() {
        super.viewDidLoad()
        dateTest()
//        aa()

    }
    func aa()  {
        let currentDateString2 = "2019-03-22 09:40:00"
        //        print(currentDateString2)
        //
        let currentDate2 = currentDateString2.convertUTC0DateStringToCurrentDate(dateFormat: dateFomat)
        print(currentDate2)
        //2019-03-22 17:40:00 +0000
        
        //convert utc0 date to utc0 string
        
        //convert utc0 date to current string
        
        //convert current date to utc0 date
        
        //convrtt current date current string
        
//        print(currentDate2.convertCurrentDateToCurrentDateString(dateFormat: dateFomat))
        
    }
    func dateTest() {
        let lastTimeString = "2019-03-22 09:40:00"
      
        print(lastTimeString.convertUTC0DateStringToCurrentDate(dateFormat: dateFomat))
        print(lastTimeString.converUTC0DateStringToCurrentDateString(dateFormat: dateFomat))
        
        
//        let aa = lastTimeString.convertUTC0DateStringToCurrentDate()
//        print(aa)
//
//
//

//
//
//
//        //convert date(utc0) to currentDateString
       
//
//
//
   
}

}
