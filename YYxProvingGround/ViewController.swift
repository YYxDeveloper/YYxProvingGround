//
//  ViewController.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/3/20.
//  Copyright © 2019年 002. All rights reserved.
//

import UIKit
//https://stackoverflow.com/questions/25195565/how-do-you-unwrap-swift-optionals
// MARK: - Modules
import Foundation
import UIKit
import CoreData



class ViewController: UIViewController {
    @IBOutlet weak var turnBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    var refreshControl: UIRefreshControl!

    let reactDefaultUITableViewController = ReactRowCollectionViewController()
    var sideBar:SideBar?
    var  cookingTimer = CookingTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
//        exampleCoreData_Create()
        
        exampleCoreDate_Read()
//        exampleCoreDataWithPredicate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewDidAppear(_ animated: Bool) {
//        dynamicTableVC.presenter.updateDatas()

    }

    @IBAction func turn(_ sender: Any) {
//        sideBar?.turn()
         refreshControl.endRefreshing()
    }
    //(Create)、讀取(Read)、更新(Update)、刪除(Delete)
    func exampleCoreData_Create()  {
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        viewContext.create1Driver(chineseName: "CiCi", iid: 999)
        viewContext.create1Driver(chineseName: "bill", iid: 999)
        viewContext.create1Driver(chineseName: "bill1", iid: 999)
        
    }
    func exampleCoreDate_Read() {
          let viewContext = NSManagedObjectContext.giveMeViewContext()
        viewContext.readDrivers(entity: Driver.self)
    }
    func exampleCoreDataWithPredicate() {
        let predicate = NSPredicate(format: "chineseName like 'b*'")
        let viewContext = NSManagedObjectContext.giveMeViewContext()
        let request:NSFetchRequest<Driver> = Driver.fetchRequest()
        
        request.predicate = predicate
        do {
            let arr = try viewContext.fetch(request)
            //                print(arr)
            _ = arr.map({print($0.chineseName ?? "XXX")})
            _ = arr.map({print($0.iid)})
            
            
        }catch{
            print(error)
        }
        
    }
    func fetchData<T:NSManagedObject>(entity: T.Type) {
        let fetchRequest = T.fetchRequest()
        let viewContext = NSManagedObjectContext.giveMeViewContext()

        do {
            fetchRequest.predicate = NSPredicate(format: "questionWasShown == %@", NSNumber(value: false))
            let result = try viewContext.fetch(fetchRequest)
            if result.count > 0 {
                // do some stuff
            }
        } catch {
            
        }
    }
    
    

}
