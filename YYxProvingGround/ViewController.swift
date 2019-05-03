//
//  ViewController.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/3/20.
//  Copyright © 2019年 002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var turnBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    var sideBar:SideBar?
    var  cookingTimer = CookingTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
       gg()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func gg()  {
        self.cookingTimer.start()
        self.cookingTimer.countingTime.addObserver{ [weak self] (timeStr,sec) in
            print("!!\(timeStr)")
             print("!!@\(sec)")
            
            
        }
    }
    func aa()  {
      self.sideBar =  SideBar(containerView: containerView, parentViewController: self, BundleButton: turnBtn)

        self.sideBar!.isLoading.addObserver { [weak self] (isLoading) in
            self?.containerView.frame.origin.x = isLoading == true ? -20:0
        }
        
    
    }
    @IBAction func turn(_ sender: Any) {
        sideBar?.turn()
    }
    
    

}
