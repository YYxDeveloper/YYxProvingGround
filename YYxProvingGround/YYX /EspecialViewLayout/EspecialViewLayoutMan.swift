//
//  EspecialViewLayoutMan.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/8/20.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit
class EspecialViewLayoutMan {
    let loginRelation = LoginPartLayout()
}

class LoginPartLayout {
    static func layoutWhiteBoard(beConstraintView:UIView,whiteBoardView:UIView,theHeight:CGFloat = 100){
         let margins = beConstraintView.layoutMarginsGuide
        NSLayoutConstraint.activate([
                whiteBoardView.topAnchor.sameAsTopAnchor(withView: beConstraintView),
                whiteBoardView.leadingAnchor.sameAsLeadingAnchor(withView: beConstraintView),
                whiteBoardView.trailingAnchor.sameAsTrailingAnchor(withView: beConstraintView),
                whiteBoardView.bottomAnchor.sameAsBottomAnchor(withView: beConstraintView)
           
            
            ])
    }
    static func layoutLoginNameViewOutsideLayout(containerView:UIView,loginNameView:UIView){
        let margins = containerView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            
            loginNameView.topAnchor.constraint(equalTo: margins.topAnchor, constant: 10),
            loginNameView.rightAnchor.constraint(equalTo: margins.rightAnchor, constant: -10),
            loginNameView.leftAnchor.constraint(equalTo: margins.leftAnchor, constant: 10),
            loginNameView.heightAnchor.constraint(equalToConstant: 50),
            
            ])
    }
    
    static func layoutLoginNameViewInsideLayout(loginNameView:UIView,imageView:UIView,textField:UIView){
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.sameAsTopAnchor(withView: loginNameView),
            imageView.bottomAnchor.sameAsBottomAnchor(withView: loginNameView),
            
            
            imageView.leadingAnchor.sameAsLeadingAnchor(withView: loginNameView),
            imageView.trailingKissLeading(withView: textField),
            imageView.widthEqualHeight(withMultiplier: 1),
            
            ])
        
        NSLayoutConstraint.activate([
            textField.sameAsSuperViewTopAnchor(),
            textField.bottomAnchor.sameAsBottomAnchor(withView: loginNameView, marginSpace: 0),
            textField.leadingKissTrailing(withView: imageView),
            textField.trailingAnchor.sameAsTrailingAnchor(withView: loginNameView, marginSpace: 0),
            
            ])
        
        
    }

    
}
