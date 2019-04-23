//
//  ViewController.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/3/20.
//  Copyright © 2019年 002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
     func giveMeCurrentGreenwichDateString(format:String) -> String{
       
        
        
        
        return DateFormatter.giveMeGreenwichOriginDateFormatter(dateFormate: format).string(from: Date())
    }
    @IBOutlet weak var horizontalSliderContainerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        aa()
    }
    
    func aa()  {
      let aa = CookingTimer()
        aa.start()
    
        
    }

}

