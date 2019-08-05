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
        containerView.layer.addBordLayer(witchColor: .blue, width: 2)
    }
    func exampleProgrammaticallyTableViewController()  {
        addSubViewWithChildController(addSubViewController: ProgrammaticallyTableViewController(), toWitchView: containerView)
    }
}
