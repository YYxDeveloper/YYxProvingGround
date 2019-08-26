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
        let dividColor:UIColor = UIColor.giveMeUIColorByHex(hex:"6E6E6")
        
        switch witchColumntype {
        case .userName:
            let imageView = UIView()
            self.addSubview(imageView)
            imageView.backgroundColor = .lightGray
            
            let textField = UITextField()
            self.addSubview(textField)
            textField.backgroundColor = .orange
            
            let dividView = UIView()
            self.addSubview(dividView)
            dividView.backgroundColor = dividColor
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            dividView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                imageView.sameAsSuperViewTopAnchor(),
                imageView.sameAsSuperViewLeadingAnchor(),
                imageView.sameAsSuperViewBottomAnchor(),
                imageView.sameAsSuperViewHeightAnchor(),
                imageView.heightEqualWidth(),
                
                dividView.topAnchor.sameAsTopAnchor(withView: dividView.firstSuperView, marginSpace: 10),
                dividView.bottomAnchor.sameAsBottomAnchor(withView: dividView.firstSuperView, marginSpace: 10),
                dividView.leadingKissTrailing(withView: imageView),
                dividView.trailingKissLeading(withView: textField),
                dividView.widthAnchor.constraint(equalToConstant: 2),
               
                textField.sameAsSuperViewTopAnchor(),
                textField.sameAsSuperViewBottomAnchor(),
                textField.sameAsSuperViewTrailingAnchor(),
                textField.heightAnchor.constraint(equalToConstant: 20),
                
                
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
