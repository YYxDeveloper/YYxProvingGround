//
//  ViewController+View.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/7/19.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    func exampleAddBoardLayer() {
//        let qrCodeFrameView = CALayer()
//        qrCodeFrameView.frame = containerView.bounds
//
//        qrCodeFrameView.borderColor = UIColor.green.cgColor
//        qrCodeFrameView.borderWidth = 2
//        containerView.layer.addSublayer(qrCodeFrameView)
        containerView.layer.addBordLayer(witchColor: .blue, width: 2)
    }
}
