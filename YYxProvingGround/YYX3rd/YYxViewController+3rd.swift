//
//  YYxViewController+3rd.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/7/24.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit
import Reachability
extension YYxViewController{
    func checkNetworkState() {
        Reachability.checkState()
    }
    func checkJailbreak() {
        
    }
    func checkInfoPlist() {
        FileManager.default.checkInfoPlistData()
    }
    
}
