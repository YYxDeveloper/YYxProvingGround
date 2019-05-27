//
//  ViewController+CoreData.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/27.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import CoreData
extension ViewController{
    //(Create)、讀取(Read)、更新(Update)、刪除(Delete)
    func exampleCoreData_Create()  {
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        viewContext.create1Driver(chineseName: "CiCi", iid: 999)
        viewContext.create1Driver(chineseName: "bill", iid: 999)
        viewContext.create1Driver(chineseName: "bill1", iid: 999)
        
    }
    func exampleCoreDate_Read() {
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        //          let predicate = NSPredicate(format: "chineseName like 'b*'")
        let predicate2 =  NSPredicate(format: "iid == 999")
        viewContext.readDrivers(entity: Driver.self, hasPredicate: predicate2)
    }
}
