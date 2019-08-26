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
    3. YYxScrollViewController.swift
 
 */

class HYBLoginMainViewController: YYxScrollViewController {
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        exampleUseInputInfoColumnsView()


    }
    
    func editInfoInputBoaderView() {
       
        let userNameColumnView = UIView()
        userNameColumnView.backgroundColor = .yellow
       userNameColumnView.editColumnView()
        
        let verifyColumn = UIView()
        verifyColumn.backgroundColor = .blue
        verifyColumn.editColumnView()
        
        
        let passwordColumnView = UIView()
        passwordColumnView.backgroundColor = .red
        passwordColumnView.editColumnView()
        
        let recommendView = UIView()
        recommendView.editColumnView()

        //parent view = scrollContainerView
        let loginInputInfoView = UIStackView(arrangedSubviews: [userNameColumnView,passwordColumnView,verifyColumn,recommendView])
        loginInputInfoView.addBackgroundColorView(color: UIColor.giveMeUIColorByHex(hex: "F5F5F5"))
        loginInputInfoView.translatesAutoresizingMaskIntoConstraints = false
        loginInputInfoView.distributeFillEqually(axis: .vertical, marginSpace: 10)
        self.scrollContainerView.addSubview(loginInputInfoView)
        
        userNameColumnView.becomeColumnView(witchColumntype: .userName)
        verifyColumn.becomeColumnView(witchColumntype: .verify)
        passwordColumnView.becomeColumnView(witchColumntype: .password)
        recommendView.becomeColumnView(witchColumntype: .recommend)
        
        UIStackView.editBoardViewConstraint(boardView: loginInputInfoView, verticlePadding: 15, horizentalPadding: 0, columnHeight: 45, howmanyColumns: 3)
        
    }
   
   
    func exampleUseInputInfoColumnsView() {
        editInfoInputBoaderView()
    }

}
