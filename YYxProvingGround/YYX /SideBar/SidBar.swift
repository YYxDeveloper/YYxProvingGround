//
//  SidBar.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/4/26.
//  Copyright © 2019年 002. All rights reserved.
//

import Foundation
import UIKit

class SideBar{
    
    let title = Observable<String>(value: "Loading")
    let isLoading = Observable<Bool>(value: false)
    let isTableViewHidden = Observable<Bool>(value: false)
    
    private let vc = ToolBoxManager.giveMeStaticTableViewController(witchTypeViewController: .StaticTableViewController)
    let containerView:UIView
    let tableView:UITableView
   
   
    
  
    init(containerView:UIView,parentViewController:UIViewController,BundleButton:UIButton) {
        self.containerView = containerView
        self.tableView     = vc.tableView
       parentViewController.addSubViewWithChildController(addSubViewController: self.vc, toWitchView: containerView)
        
    }
    func turn() {
        self.isLoading.value = true
    }
   
    
}

class Observable<T> {
    var value: T {
        didSet {
            DispatchQueue.main.async {
                self.valueChanged?(self.value)
            }
        }
    }
    
    private var valueChanged: ((T) -> Void)?
    
    init(value: T) {
        self.value = value
    }
    
    /// Add closure as an observer and trigger the closure imeediately if fireNow = true
    func addObserver(fireNow: Bool = true, _ onChange: ((T) -> Void)?) {
        valueChanged = onChange
        if fireNow {
            onChange?(value)
        }
    }
    
    func removeObserver() {
        valueChanged = nil
    }
    
}
