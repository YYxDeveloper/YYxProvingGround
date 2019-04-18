//
//  ViewController.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/3/20.
//  Copyright © 2019年 002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var horizontalSliderContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        aa()
    }
    
    func aa()  {
//        let aa = "2019-04-12 12:59:00"
        let bb = "17:54:50"
        let cc = "09:45:00"
        

        let yy = String.compare2Stamp(format: DateFormatter.defaultTimeFormat, timeStr1: cc, timeStr2: bb)
        print(yy)
//        print(aa.giveMeRangeOfString(theStartIndex: 11, theEndIndex: 19))
        
    }

}

