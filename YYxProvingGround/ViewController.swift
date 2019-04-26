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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        aa()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func aa()  {
      self.sideBar =  SideBar(containerView: containerView, parentViewController: self, BundleButton: turnBtn)
       
        self.sideBar!.isLoading.addObserver { [weak self] (isLoading) in
            if isLoading {
                self?.containerView.frame.origin.x = -20
            } else {
                
            }
        }
    }
    @IBAction func turn(_ sender: Any) {
        sideBar?.turn()
    }
    
    

}
extension Int{
   
}
