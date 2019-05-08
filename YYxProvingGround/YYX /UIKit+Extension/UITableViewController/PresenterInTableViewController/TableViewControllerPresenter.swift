//
//  TableViewControllerPresenter.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/8.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
class TableViewControllerPresenter {
    var rowDatas = [String]()
    
    init() {
        updateDatasFirstTime()
    }
    func updateDatasFirstTime()  {
        let fakeDatas = ["ray","sam","bill","jay"]
        rowDatas = fakeDatas
    }
    func updateDatas() {
        
    }
}
