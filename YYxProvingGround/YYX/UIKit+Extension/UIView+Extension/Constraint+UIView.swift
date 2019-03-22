//
//  Constraint+UIView.swift
//  BasicTableViewController
//
//  Created by 002 on 2019/2/26.
//  Copyright © 2019年 002. All rights reserved.
//

import Foundation
import UIKit
extension UIView{
    func anchorEqualParentView() {
        //https://medium.com/@hassanahmedkhan/autolayouts-via-layout-anchors-5214b3f746a9
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo:firstSuperView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: firstSuperView.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: firstSuperView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: firstSuperView.bottomAnchor).isActive = true
    }
    func anchorEqualParentViewWithConstant(constant:CGFloat) {
        //https://medium.com/@hassanahmedkhan/autolayouts-via-layout-anchors-5214b3f746a9
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo:firstSuperView.leadingAnchor,constant:constant).isActive = true
        self.trailingAnchor.constraint(equalTo: firstSuperView.trailingAnchor,constant:constant).isActive = true
        self.topAnchor.constraint(equalTo: firstSuperView.topAnchor,constant:constant).isActive = true
        self.bottomAnchor.constraint(equalTo: firstSuperView.bottomAnchor,constant:constant).isActive = true
    }
    func anchorEqualCenter() {
        //https://medium.com/@hassanahmedkhan/autolayouts-via-layout-anchors-5214b3f746a9
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.heightAnchor.constraint(equalToConstant: 300).isActive = true
        self.centerXAnchor.constraint(equalTo: firstSuperView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: firstSuperView.centerYAnchor).isActive = true
    }
   
    
}
