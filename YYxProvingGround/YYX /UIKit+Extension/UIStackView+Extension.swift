//
//  UIStackView+Extension.swift
//  YYxProvingGround
//
//  Created by 呂子揚 on 2019/8/5.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView{
    func distributeFillEqually(axis:NSLayoutConstraint.Axis,marginSpace:CGFloat) {
        self.axis = axis
        self.spacing = marginSpace
        self.distribution = .fillEqually
    }
}

