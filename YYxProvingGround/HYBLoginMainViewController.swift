//
//  HYBLoginMainViewController.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/8/21.
//  Copyright © 2019 002. All rights reserved.
//

import UIKit
/**
    - 1.圖片全部設定為2pt 所以根據文檔px格式全都除以2做轉換，三位數以上個位數會四捨五入
 
 
 */
/**
 reference file list:
    1. UIStackView+Extension.swif
    2. Extension+UIView.swift
    3.
 
 */

class HYBLoginMainViewController: YYxScrollViewController {
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        exampleUseInputInfoColumnsView()


    }
    
    func editInfoInputBoaderView() {
       
        
        let userNameColumnView = UIView()
        userNameColumnView.backgroundColor = .yellow
        userNameColumnView.translatesAutoresizingMaskIntoConstraints = false
        
        
        let passwordColumnView = UIView()
        passwordColumnView.backgroundColor = .blue
        passwordColumnView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //parent view = scrollContainerView
        let loginInputInfoView = UIStackView(arrangedSubviews: [userNameColumnView,passwordColumnView])
        loginInputInfoView.addBackgroundColorView(color: UIColor.giveMeUIColorByHex(hex: "F5F5F5"))
        loginInputInfoView.translatesAutoresizingMaskIntoConstraints = false
        loginInputInfoView.distributeFillEqually(axis: .vertical, marginSpace: 10)
        self.scrollContainerView.addSubview(loginInputInfoView)
        userNameColumnView.becomeColumnView(witchColumntype: .userName)
        passwordColumnView.becomeColumnView(witchColumntype: .password)
        
        UIStackView.editBoardViewConstraint(boardView: loginInputInfoView, verticlePadding: 15, horizentalPadding: 0, columnHeight: 45, howmanyColumns: 3)
        
    }
   
   
    func exampleUseInputInfoColumnsView() {
        editInfoInputBoaderView()
    }

}
