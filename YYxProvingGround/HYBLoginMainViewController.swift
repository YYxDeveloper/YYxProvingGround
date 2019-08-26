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
    enum textFieldPlaceholder:String {
        case 请输入手机号,请输入验证码,passwordText = "请输入6-16位数字或字母的密码",recommendText = "请输推荐码（选填）"
    }
    
    
    
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
        
        userNameColumnView.becomeColumnView(witchColumntype: .userName, delegate: self)
        verifyColumn.becomeColumnView(witchColumntype: .verify, delegate: self)
        passwordColumnView.becomeColumnView(witchColumntype: .password, delegate: self)
        recommendView.becomeColumnView(witchColumntype: .recommend, delegate: self)
        
        UIStackView.editBoardViewConstraint(boardView: loginInputInfoView, verticlePadding: 15, horizentalPadding: 0, columnHeight: 45, howmanyColumns: 3)
        
    }
   
   
    func exampleUseInputInfoColumnsView() {
        editInfoInputBoaderView()
    }

}
extension HYBLoginMainViewController:UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        textField.becomeFirstResponder()
        switch textField.placeholder {
        case HYBLoginMainViewController.textFieldPlaceholder.请输入手机号.rawValue:
            print("1")
        case HYBLoginMainViewController.textFieldPlaceholder.passwordText.rawValue:
            print("2")
        case HYBLoginMainViewController.textFieldPlaceholder.请输入验证码.rawValue:
            print("3")
        case HYBLoginMainViewController.textFieldPlaceholder.recommendText.rawValue:
            print("4")
            
        default:
             print("5")
        }
//        usingTextField = textField
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
