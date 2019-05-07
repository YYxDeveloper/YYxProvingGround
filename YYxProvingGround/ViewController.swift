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
//       gg()
//        dd()
//        uu()
//        ll()
        oo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    func oo() {
        do {
            
            let dicData = try  FileManager.default.readPlistDictionaryFromBundle(fileName: "PlistDictionaryExample")
//            print(dicData)
            let arrData = try FileManager.default.readPlistArrayFromBundle(fileName: "PlistArrayExample")
            print(arrData)
            // json 還沒轉型
            //refer : JSONDecoder() ;;ever
            
            /**
             do {
             let JsonStruct = try JSONDecoder().decode(ZooModel.self, from: content.data(using: .utf8)!)
             print(JsonStruct.result.results[0].A_Name_Ch)
             } catch  {
             print(error)
             }
             */
            
            
            
        } catch  {
            print(error.localizedDescription)
        }
      
        
        

    }
    func ll()  {
       self.addToolBoxStaticTableViewController(toWitchView: view, toolBoxVCType: .StaticCollectionViewController)
    }
    func uu()  {
        self.addToolBoxStaticTableViewController(toWitchView: self.view, toolBoxVCType: .ToolBoxViewController)
    }
  
    func dd() {
        containerView.addCircleLayer(strokeColor: .blue, anitmation: true, duration: 5)
    }
    func gg()  {
        self.cookingTimer.start()
        self.cookingTimer.countingTime.addObserver{ [weak self] (timeStr,sec) in
//            print("!!\(timeStr)")
//             print("!!@\(sec)")
            
            
        }
    }
    func aa()  {
      self.sideBar =  SideBar(containerView: containerView, parentViewController: self, BundleButton: turnBtn)

        self.sideBar!.isLoading.addObserver { [weak self] (isLoading) in
            self?.containerView.frame.origin.x = isLoading == true ? -20:0
        }
        
    
    }
    @IBAction func turn(_ sender: Any) {
        sideBar?.turn()
    }
    
    

}
