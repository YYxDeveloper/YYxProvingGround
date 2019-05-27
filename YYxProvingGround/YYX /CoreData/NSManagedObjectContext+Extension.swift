//
//  NSManagedObjectContext+Extension.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/27.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObjectContext{
    static func giveMeViewContext() -> NSManagedObjectContext{
        return AppDelegate.giveMeAppDelegate().persistentContainer.viewContext
    }
    func create1Driver(chineseName:String?,iid:Int) {
        let appDelegate = AppDelegate.giveMeAppDelegate()
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        
        let driver1 = Driver(context:viewContext )
        driver1.chineseName = chineseName
        driver1.iid = Int64(iid)
        
        appDelegate.saveContext()
    }
    func readDrivers() {
        let request:NSFetchRequest<Driver> = Driver.fetchRequest()
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        
        do {
            let arr = try viewContext.fetch(request)
            //                print(arr)
            _ = arr.map({print($0.chineseName ?? "XXX")})
            _ = arr.map({print($0.iid)})
            
            
        }catch{
            print(error)
        }
        
    }
}
