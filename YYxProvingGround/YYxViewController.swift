//
//  YYxViewController.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/6/11.
//  Copyright © 2019 002. All rights reserved.
//

import UIKit
import Reachability
class YYxViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        //網路狀態
        checkNetworkState()
        checkJailbreak()
        // Do any additional setup after loading the view.
    }
    func checkNetworkState() {
         Reachability.checkState()
    }
    func checkJailbreak() {
        
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
