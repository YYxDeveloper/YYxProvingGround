//
//  InputInfoColumnView+UIView.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/8/22.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    enum columnType{
        case userName,password,verify,recommend
    }
    func becomeColumnView(witchColumntype:columnType){
        
        switch witchColumntype {
        case .userName:
            let imageView = UIView()
            self.addSubview(imageView)
            imageView.backgroundColor = .lightGray
            let textField = UITextField()
            self.addSubview(textField)
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
        case .password:
            let imageView = UIView()
            self.addSubview(imageView)
            imageView.backgroundColor = .red
            let textField = UITextField()
            self.addSubview(textField)
            textField.backgroundColor = .green
            
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
}
