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
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var stackView: UIStackView!
    let tView = UIView()
    
    var activeViewConstraints: [NSLayoutConstraint] = [] {
        willSet {
            NSLayoutConstraint.deactivate(activeViewConstraints)
        }
        didSet {
            NSLayoutConstraint.activate(activeViewConstraints)
        }
    }
    var myDatePicker: UIDatePicker!
    let pinCodeInputView: PinCodeInputView<ItemView> = .init(
        digit: 6,
        itemSpacing: 8,
        itemFactory: {
            return ItemView()
    },
        autoresizes: true)
    @IBOutlet weak var fontTestLabel: UILabel!
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
        turnBtn.imageView?.contentMode = .scaleAspectFit
        //        topShadowView.roundCorners(corners: [.topRight, .topLeft], radius: 20)
                
                let maskPath1 = UIBezierPath(roundedRect: fontTestLabel.bounds,
                                             byRoundingCorners: [.topRight, .topLeft],
                                             cornerRadii: CGSize(width: 50, height: 50))
                let maskLayer1 = CAShapeLayer()
                maskLayer1.frame = fontTestLabel.bounds
                maskLayer1.path = maskPath1.cgPath
                    fontTestLabel.layer.mask = maskLayer1
//        exampleViewAddShadow3()
//        exampleViewAddShadow2()
//        exampleViewAddShadow1()
//        exampleFaceIDAndTouchID()
//        exampleDecodeJsonDatabyUtf8(witchModel: .UserInformationsJsonExample)
//       exampleDecodeWithAES()
//        examplePinCodeiew()
//        exampleChaCha20()
//        exampleAESCryptoSwift()
        
        
        
        //        exampleFaceIDAndTouchID()
        //        exampleDecodeJsonDatabyUtf8(witchModel: .UserInformationsJsonExample)
        //       exampleDecodeWithAES()
        //        examplePinCodeiew()
        //        exampleChaCha20()
        //        exampleAESCryptoSwift()
        
        //        exampleFontLength()
        //        exampleCryptoSwift()
        
        //數值透過didset將UI連動
        //        examplePrepocessorMarco()
        //        exampleSameAsConstraint()
        if #available(iOS 13.0, *) {
            
            //combine framework test
            //            exampleCombine_assign()
            //            exampleCombine_CurrentValueSubject()
        } else {
            // Fallback on earlier versions
        }
        //        exampleDatePicker()
        //        exampleDateAppend1Day()
        //        exampleUIViewPropertyAnimator()
        //        exampleUIViewPropertyAnimatorRotate()
        //        exampleUIViewPropertyAnimatorWithCompletion()
        
        //        let image = generateQRCode(from: "Hacking with Swift is the best iOS coding tutorial I've ever read!")
        let image = UIImage.giveMeQRCode(from: "aaaa", backgroundColor: .red, frontGroundColor: .blue)
        turnBtn .setImage(image, for: .normal)
        
        exampleAnchorAnimation()
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
        // ***** [3] *****
        activeViewConstraints = [
            tView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ]
        
        UIView.animate(withDuration: 0.33, delay: 0.5, options: .curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
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
