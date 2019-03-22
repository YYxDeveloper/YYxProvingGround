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
//        dateTest()
        

    }
    func dateTest() {
        let lastTimeString = "2019-03-22 09:40:00"
        
        let yy = lastTimeString.convertUTC0ToCurrent(dateFormat: DateFormatter.ixFormat)
        
        print(yy)
        
        let xx = yy.convertCurrentToUTC0(dateFormat: DateFormatter.ixFormat)
        print(xx)
    }
}

