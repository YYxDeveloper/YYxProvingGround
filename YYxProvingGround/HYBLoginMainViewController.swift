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
        
        
//        let aa = LoginInputInfoView(addWitchSubView: scrollContainerView)
       
       editLoginInputInfoView()



    }
    
    func editLoginInputInfoView() {
        //parent view = scrollContainerView
        let loginInputInfoView = UIView()
        loginInputInfoView.backgroundColor = UIColor.giveMeUIColorByHex(hex: "F5F5F5")
        loginInputInfoView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollContainerView.addSubview(loginInputInfoView)
        
        //parent view = loginInputInfoView
//        let userNameColumnView = UIView()
//        userNameColumnView.backgroundColor = .yellow
//        userNameColumnView.translatesAutoresizingMaskIntoConstraints = false
//        loginInputInfoView.addSubview(userNameColumnView)
        
        
        //parent view = loginInputInfoView
//        let passwordColumnView = UIView()
//        passwordColumnView.backgroundColor = .blue
//        passwordColumnView.translatesAutoresizingMaskIntoConstraints = false
//        loginInputInfoView.addSubview(passwordColumnView)
        
        func editViewConstraint(witchView:UIView){
            let loginInputInfoParentView = witchView.firstSuperView

            if #available(iOS 11, *) {
                let guide = witchView.firstSuperView.safeAreaLayoutGuide
                witchView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0).isActive = true
                
                
                
            } else {
                witchView.topAnchor.sameAsTopAnchor(withView: loginInputInfoParentView,marginSpace: 20).isActive = true
            }
            
            if #available(*, iOS 6){
                //不支援NSLayoutConstraint
            }
            
            let verticlePadding:CGFloat = 15
            let horizentalPadding:CGFloat = 0
            let columnHeight:CGFloat = 45
            let howmanyColumns:CGFloat = 2
            
            NSLayoutConstraint.activate([
                witchView.leadingAnchor.sameAsLeadingAnchor(withView: loginInputInfoParentView),
                witchView.trailingAnchor.sameAsTrailingAnchor(withView: loginInputInfoParentView),
                witchView.heightAnchor.constraint(equalToConstant: columnHeight * howmanyColumns + 15 * 1)
                
                ])
        }
        editViewConstraint(witchView: loginInputInfoView)
      
        
       
        
       
       
        
        
        
//        NSLayoutConstraint.activate([
//            userNameColumnView.topAnchor.sameAsTopAnchor(withView: loginInputInfoView),
//            userNameColumnView.leadingAnchor.sameAsLeadingAnchor(withView: loginInputInfoView, marginSpace: horizentalPadding),
//            userNameColumnView.trailingAnchor.sameAsTrailingAnchor(withView:  loginInputInfoView, marginSpace: horizentalPadding),
//            userNameColumnView.heightAnchor.constraint(equalToConstant: columnHeight),
//        ])
        
       
        
//        NSLayoutConstraint.activate([
//            passwordColumnView.topAnchor.constraint(equalTo: userNameColumnView.bottomAnchor, constant: verticlePadding),
//            passwordColumnView.leadingAnchor.sameAsLeadingAnchor(withView: userNameColumnView),
//            passwordColumnView.trailingAnchor.sameAsTrailingAnchor(withView: userNameColumnView),
//            passwordColumnView.heightAnchor.constraint(equalToConstant: columnHeight)
//            ])
        
        //parent view = loginInputInfoView
//        let checkListView = UIView()
//        checkListView.backgroundColor = .red
//        checkListView.translatesAutoresizingMaskIntoConstraints = false
//        loginInputInfoView.addSubview(checkListView)
//
//        NSLayoutConstraint.activate([
//            checkListView.topAnchor.constraint(equalTo: passwordColumnView.bottomAnchor, constant: 15),
//            checkListView.leadingAnchor.sameAsLeadingAnchor(withView: userNameColumnView),
//            checkListView.trailingAnchor.sameAsTrailingAnchor(withView: userNameColumnView),
//            checkListView.heightAnchor.constraint(equalToConstant: 16)
//            ])
    }
    enum columnType{
        case userName,password,verify,recommend
    }
    
    func insertSubViewViewInColumnView(witchView:UIView,witchColumntype:columnType){
        
        switch witchColumntype {
        case .userName:
            //parent view = loginNameColumnView
            let imageView = UIView()
            witchView.addSubview(imageView)
            imageView.backgroundColor = .lightGray
            let textField = UITextField()
            witchView.addSubview(textField)
            textField.backgroundColor = .orange
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                imageView.sameAsSuperViewTopAnchor(),
                imageView.sameAsSuperViewLeadingAnchor(),
                imageView.sameAsSuperViewBottomAnchor(),
                imageView.sameAsSuperViewHeightAnchor(),
                imageView.heightEqualWidth(),
                imageView.trailingKissLeading(withView: textField),
                
                textField.sameAsSuperViewTopAnchor(),
                textField.sameAsSuperViewBottomAnchor(),
                textField.sameAsSuperViewHeightAnchor(),
                textField.sameAsSuperViewTrailingAnchor()
                
                
                ])
        default:
            print("not finish")
        }
        
        
        
        
    }
    func editLoginInputInfoSubView(theParentView:UIView) {
        let loginNameView = UIView()
        loginNameView.backgroundColor = .yellow
        loginNameView.translatesAutoresizingMaskIntoConstraints = false
        theParentView.addSubview(loginNameView)
        
        
        let imageView = UIView()
        theParentView.addSubview(imageView)
        imageView.backgroundColor = .blue
        let textField = UITextField()
        theParentView.addSubview(textField)
        textField.backgroundColor = .orange
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        LoginPartLayout.layoutLoginNameViewOutsideLayout(containerView: theParentView, loginNameView: loginNameView)
        LoginPartLayout.layoutLoginNameViewInsideLayout(loginNameView: loginNameView, imageView: imageView, textField: textField)
    }
    
   
   static  func layoutLoginInputInfoView(beConstraintView:UIView,loginInputInfoView:UIView) {
        if #available(iOS 11, *) {
            let guide = beConstraintView.safeAreaLayoutGuide
            loginInputInfoView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0).isActive = true



        } else {
            loginInputInfoView.topAnchor.sameAsTopAnchor(withView: beConstraintView,marginSpace: 20).isActive = true
        }

        if #available(*, iOS 6){
            //不支援NSLayoutConstraint
        }


        NSLayoutConstraint.activate([
            loginInputInfoView.leadingAnchor.sameAsLeadingAnchor(withView: beConstraintView),
            loginInputInfoView.trailingAnchor.sameAsTrailingAnchor(withView: beConstraintView),
            loginInputInfoView.heightAnchor.constraint(equalToConstant: 105)

            ])
    }
    


}
