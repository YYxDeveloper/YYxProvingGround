//
//  NavigationYestViewController.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/10/21.
//  Copyright © 2019 002. All rights reserved.
//

import UIKit

class NavigationYestViewController: UIViewController {

    @IBOutlet weak var topMarginTestView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.topAnchor
//        topMarginTestView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        topMarginTestView.setTopConstraintEqualStatusBar()
        // Do any additional setup after loading the view.
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
