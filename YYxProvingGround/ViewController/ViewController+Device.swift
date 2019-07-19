//
//  ViewController+Device.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/7/19.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit
extension ViewController{
    func exampleDeviceOrientation() {
        print("must override viewDidLayoutSubviews & supportedInterfaceOrientations")
    }
    override func viewDidLayoutSubviews() {
        let deviceOrientation = UIDevice.current.orientation
//        print(deviceOrientation.rawValue)
    }
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask     {
        return .all
    }
}
