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
//        topMarginTestView.setTopConstraintEqualStatusBar()
        topMarginTestView.setTopAnchorEqualStatusBarTop(witchViewController: self)

    
      
    }
    override func viewWillAppear(_ animated: Bool) {
       self.modalPresentationCapturesStatusBarAppearance = false

//                 statusBar.isHidden = true
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
