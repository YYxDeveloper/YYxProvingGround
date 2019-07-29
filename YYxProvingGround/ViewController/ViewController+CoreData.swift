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
        Driver.create1Driver(chineseName: "CiCi", iid: 999)
        Driver.create1Driver(chineseName: "bill", iid: 999)
        Driver.create1Driver(chineseName: "bill1", iid: 999)
        AppDelegate.giveMeAppDelegate().saveContext()
        
    }
    func exampleCoreDataFetchWithTemplate() {

        let model: NSManagedObjectModel = NSManagedObjectModel.giveMeInstance()
        
        let request = model.fetchRequestTemplate(forName: "MY_REQUEST1")
        Driver.showDriverDatas(request: request!)
        
    }
    func exampleCoreData_SomeoneBuyCarAndBike() {
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        
        let driver1 = Driver(context:viewContext )
        driver1.chineseName = "GiGi"
        driver1.iid = Int64(8888)
        
        let car = Car(context: viewContext)
        car.ownerChineseName = "aaaa"
        
        let bike = Bike(context: viewContext)
        bike.ownerChineseName = "bbbb"
        bike.bikeLicense = "xxxx-xxx"
        
        
        driver1.addToBetweenCar(car)
        driver1.addToBetweenBike(bike)
        AppDelegate.giveMeAppDelegate().saveContext()
        
        
        
    }
    func exampleCoreDate_ReadWhoHasRelateobject() {
//                let predicate2 =  NSPredicate(format: "iid == 8888")        
        let request: NSFetchRequest<Driver> = Driver.fetchRequest()
        request.predicate = NSPredicate.giveMePrePredicatePreFixString(withcProperty: "chineseName", prefix: "G")
        Driver.showDriverDatas(request: request as! NSFetchRequest<NSFetchRequestResult>)
    }
    func exampleCoreDataShowAllBikes()  {
        let request: NSFetchRequest<Driver> = Driver.fetchRequest()
        
        Driver.showDriverDatas(request: request as! NSFetchRequest<NSFetchRequestResult>)
    }
    func exampleDelete1Bike() {
        let request: NSFetchRequest<Bike> = Bike.fetchRequest()
        //        request.predicate = NSPredicate.giveMePrePredicatePreFixString(withcProperty: "ownerChineseName", prefix: "t")
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        do {
            if let arr = try viewContext.fetch(request) as? [Bike] {
                
                
                _ = arr.map({print($0.ownerChineseName ?? "no ownerChineseName name")})
                for theBike in arr where theBike.ownerChineseName == "ttttt"{
                    print("find it \(theBike.ownerChineseName)")
                    viewContext.delete(theBike)
                }
                AppDelegate.giveMeAppDelegate().saveContext()
                _ = arr.map({print($0.ownerChineseName ?? "no ownerChineseName name")})
            }
        }catch{
            YYxErrorHandler.printConvertErrorFail()
            print(error)
        }
        
    }
}
