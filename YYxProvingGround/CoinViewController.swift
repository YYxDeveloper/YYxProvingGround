//
//  CoinViewController.swift
//  YYxProvingGround
//
//  Created by young.lu on 2020/3/3.
//  Copyright © 2020 002. All rights reserved.
//

import UIKit

class CoinViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
 override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        print("Device was shaken!")
    }
    override func becomeFirstResponder() -> Bool {
        return true
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
