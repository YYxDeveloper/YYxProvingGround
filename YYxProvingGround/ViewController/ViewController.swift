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
import MessageUI


import SystemConfiguration

class ViewController: UIViewController {
   
    @IBOutlet weak var turnBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var enterTextField: UITextField!
    var refreshControl: UIRefreshControl!
    var testType = true
    lazy var codeLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.textColor = UIColor.black
        label.lineBreakMode = .byWordWrapping
        label.backgroundColor = UIColor.red
        label.numberOfLines = 2
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.text = "test"
        
        
        return label
    }()
    lazy var codeButton:UIButton = {
        
        let btn = UIButton()
        btn.setTitle("codeBtn", for: .normal)
        btn.setBackgroundColor(.red, for: .normal)
        return btn
    }()
    var obserString =  "the string"{
        didSet{
            codeLabel.text = obserString
        }
    }
    let reactDefaultUITableViewController = ReactRowCollectionViewController()
    var sideBar:SideBar?
    var  cookingTimer = CookingTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        hideContainerView(isHidden: false)
        
        wantCodeButton()
        wantCodeLabel()
        codeLabel.text = obserString
        
        
        
        //數值透過didset將UI連動
//        examplePrepocessorMarco()
//        exampleSameAsConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewDidAppear(_ animated: Bool) {
//        dynamicTableVC.presenter.updateDatas()
//        print("xxxx\(connectedToNetwork())")
//        exampleRandomCGflotMultiplier()
    }
   

    @IBAction func turn(_ sender: Any) {
//        sideBar?.turn()
//         refreshControl.endRefreshing()
//         exampleSendEmail()
    }
  
   
}
extension ViewController{
    func hideContainerView(isHidden:Bool) {
        containerView.isHidden = isHidden
    }
    func wantCodeButton() {
        view.addSubview(codeButton)
        codeButton.anchorEqualCenter(height: 50, width: 50)
        codeButton.addTarget(self, action: #selector(clickCodeBtn), for: .touchUpInside)
        
    }
    @objc func clickCodeBtn() {
        obserString = "it is change"
    }
    func wantCodeLabel() {
        containerView.addSubview(codeLabel)
        //因為沒有addsubView,要做完這部才能拉layout，所以勢必會分成兩部
        codeLabel.anchorEqualParentView()
    }
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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }

}
