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
import CoreData

import SystemConfiguration

func connectedToNetwork() -> Bool {
    
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
            SCNetworkReachabilityCreateWithAddress(nil, $0)
        }
    }) else {
        return false
    }
    
    var flags: SCNetworkReachabilityFlags = []
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
        return false
    }
    
    let isReachable = flags.contains(.reachable)
    let needsConnection = flags.contains(.connectionRequired)
    
    return (isReachable && !needsConnection)
}


class ViewController: UIViewController {
    @IBOutlet weak var turnBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    var refreshControl: UIRefreshControl!

    let reactDefaultUITableViewController = ReactRowCollectionViewController()
    var sideBar:SideBar?
    var  cookingTimer = CookingTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
//      exampleDecodeJsonDatabyUtf8(witchModel: .exampleDictionaryStructure)
//        exampleGenerateUUID()
//        exampleSliderViewController()
//        exampleVisualFormat()
//        examplePrintEnumToArray()
//        exampleCoreData_SomeoneBuyCarAndBike()
//        exampleCoreDate_ReadWhoHasRelateobject()
//        exampleCoreData_Create()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewDidAppear(_ animated: Bool) {
//        dynamicTableVC.presenter.updateDatas()
//        print("xxxx\(connectedToNetwork())")

    }
   

    @IBAction func turn(_ sender: Any) {
//        sideBar?.turn()
         refreshControl.endRefreshing()
    }
  
   
}
