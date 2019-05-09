//
//  TableViewControllerPresenter.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/8.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
class TableViewControllerPresenter {
    private var orginalDatas = [Any]()
    private var allDataS = [Any]()
    var cellDatas = [Any]()
    
    init() {
       
    }
    func updateDatasFirstTime<T>(cellRequiment:[T])  {
       
        cellDatas = cellRequiment
    }
    func updateDatas() {
        
    }
}
