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
        let aa = "2019-04-12 12:59:00"
        
//        let gg = aa.convertToGreenwichStamp().convertStampToCurrentString(dateFormat: DateFormatter.defaultFormat)
//        let bb =
        let bb = aa.convertToCurrentDate()
//        print(bb)
        
//        print(Date.giveMeCurrentDateString(format: DateFormatter.defaultFormat))
        
    }

}

