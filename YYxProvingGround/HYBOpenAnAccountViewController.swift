//
//  HYBOpenAnAccountViewController.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/8/26.
//  Copyright © 2019 002. All rights reserved.
//

import UIKit

class HYBOpenAnAccountViewController: UIViewController {
     let headBackgroundView = UIImageView()
     let headLabelsView = UIStackView()
     let selectedView = UIStackView()
     let bodyView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editHeadView()
        
    }
    func editHeadView() {
        let guide = view.safeAreaLayoutGuide
        
        func constraintHeadBackgroundView(){
            self.view.addSubview(headBackgroundView)
            headBackgroundView.translatesAutoresizingMaskIntoConstraints = false
            headBackgroundView.image = UIImage(named: "bg")
            
           NSLayoutConstraint.activate([
                headBackgroundView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1),
                headBackgroundView.sameAsSuperViewLeadingAnchor(),
                headBackgroundView.sameAsSuperViewTrailingAnchor(),
            
            
           ])
        }
        constraintHeadBackgroundView()
        
        
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
