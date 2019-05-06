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

// MARK: - PROTOCOL
protocol OptionalType { init() }

// MARK: - EXTENSIONS
extension String: OptionalType {}
extension Int: OptionalType {}
extension Double: OptionalType {}
extension Bool: OptionalType {}
extension Float: OptionalType {}
extension CGFloat: OptionalType {}
extension CGRect: OptionalType {}
extension UIImage: OptionalType {}
extension IndexPath: OptionalType {}
extension Date: OptionalType {}
extension UIFont: OptionalType {}
extension UIColor: OptionalType {}
extension UIViewController: OptionalType {}
extension UIView: OptionalType {}
extension NSMutableDictionary: OptionalType {}
extension NSMutableArray: OptionalType {}
extension NSMutableSet: OptionalType {}
extension NSEntityDescription: OptionalType {}
extension Int64: OptionalType {}
extension CGPoint: OptionalType {}
extension Data: OptionalType {}
extension NSManagedObjectContext: OptionalType {}

prefix operator ?*

//unwrapping values
prefix func ?*<T: OptionalType>( value: T?) -> T {
    guard let validValue = value else { return T() }
    return validValue
}
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
class FormPresenter {
    var columns:Int?
    var row:    Int?
    
    
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
        var name: String? = nil
       print(?*name)
        

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
