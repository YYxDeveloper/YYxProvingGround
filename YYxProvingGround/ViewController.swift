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


//------------
//https://stackoverflow.com/questions/37442593/custom-operator-to-simplify-if-let
infix operator ?=
func ?= <T>( left: inout T, right: T?) {
    if let right = right {
        left = right
    }
}

// overload to deal with an optional left handed side
func ?= <T>( left: inout T?, right: T?) {
    if let right = right {
        left = right
    }
}
//---------
class ColumnTableViewController: UITableViewController {
    
    
}
class FormRows {
    var columns = [UICollectionViewCell]()
}
class FormPresenter {

    private var oringinalDatas = [FormRows]()
    
    var  columns = [UITableViewCell]()
    var  rows    = [UICollectionViewCell]()
    
  
    
}


class ViewController: UIViewController {
    @IBOutlet weak var turnBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    
    var sideBar:SideBar?
    var  cookingTimer = CookingTimer()
    override func viewDidLoad() {
        super.viewDidLoad()

       
       createOwnDynamicTableViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
  
    func createOwnDynamicTableViewController()   {
        let vc = PresenterInTableViewController()
       
        self.addSubViewWithChildController(addSubViewController: vc, toWitchView: view)
        
    }
    func oo() {
        do {
            //PlistDictionaryExample
            let ss = try FileManager.default.readJsonFileFromBundle("UserInformationsJsonExample").data(using: .utf8)
            // json 還沒轉型
            //refer : JSONDecoder() ;;ever
            let JsonStruct = try JSONDecoder().decode(UserInformations.self, from: ss!)
            for user in JsonStruct.userProfiles {
                print(user.name)
            }
        } catch  {
            print(error)
        }
    }
  
   
    func mvvmBindingForInstance()  {
        self.cookingTimer.start()
        self.cookingTimer.countingTime.addObserver{ [weak self] (timeStr,sec) in
//            print("!!\(timeStr)")
//             print("!!@\(sec)")
            
            
        }
    }
 
    @IBAction func turn(_ sender: Any) {
        sideBar?.turn()
    }
    
    

}
