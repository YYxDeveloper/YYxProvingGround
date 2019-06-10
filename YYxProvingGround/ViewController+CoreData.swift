//
//  ViewController+CoreData.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/27.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import CoreData
import UIKit
extension ViewController{
    //(Create)、讀取(Read)、更新(Update)、刪除(Delete)
    func exampleCoreData_Create()  {
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        Driver.create1Driver(chineseName: "CiCi", iid: 999)
        Driver.create1Driver(chineseName: "bill", iid: 999)
        Driver.create1Driver(chineseName: "bill1", iid: 999)
        AppDelegate.giveMeAppDelegate().saveContext()
        
    }
    func exampleCoreDate_Read() {
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        //          let predicate = NSPredicate(format: "chineseName like 'b*'")
        let predicate2 =  NSPredicate(format: "iid == 999")
        Driver.readDrivers(entity: Driver.self, hasPredicate: predicate2)
    }
    func exampleCoreDataFetchWithTemplate() {

        let model: NSManagedObjectModel = NSManagedObjectModel.giveMeInstance()
        
        let request = model.fetchRequestTemplate(forName: "MY_REQUEST1")
        Driver.showDriverDatas(request: request!)
        
    }
    
}
