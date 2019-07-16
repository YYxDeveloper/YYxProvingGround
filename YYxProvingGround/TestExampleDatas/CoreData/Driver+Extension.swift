//
//  Driver+Extension.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/6/10.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import CoreData
extension Driver{
    static func showDriverDatas(request:NSFetchRequest<NSFetchRequestResult>) {
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        do {
            if let arr = try viewContext.fetch(request) as? [Driver] {
                _ = arr.map({print($0.chineseName ?? "no chinese name")})
                _ = arr.map({print($0.iid)})
                _ = arr.map({
                    let cars = $0.betweenCar?.allObjects as? [Car] ?? [Car]()
                    _ = cars.map({print("Car owner: \($0.ownerChineseName ?? "car has no owner")")})
                })
                
            }
        }catch{
            YYxErrorHandler.printConvertErrorFail()
            print(error)
        }
    }
   static func create1Driver(chineseName:String?,iid:Int) {
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        
        let driver1 = Driver(context:viewContext )
        driver1.chineseName = chineseName
        driver1.iid = Int64(iid)
    }
}
