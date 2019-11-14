//
//  ViewController+Device.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/7/19.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit
import LocalAuthentication

extension ViewController{
    func exampleDetectkeyboardShowing() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //after
//        deinit {
//            NotificationCenter.default.removeObserver(self)
//        }
    }
    func exampleDeviceOrientation() {
        print("must override viewDidLayoutSubviews & supportedInterfaceOrientations")
    }
    override func viewDidLayoutSubviews() {
        let deviceOrientation = UIDevice.current.orientation
//        print(deviceOrientation.rawValue)
    }
    override open var supportedInterfaceOrientations : UIInterfaceOrientationMask     {
        return .all
    }
    @objc func keyboardWillShow() {
        print("鍵盤即將彈出")
    }
    
    func exampleFaceIDAndTouchID() {
        //https://medium.com/jeremy-xue-s-blog/swift-%E7%8E%A9%E7%8E%A9-touch-id-faceid-%E9%A9%97%E8%AD%89-d30be0ac803b
        // 創建 LAContext 實例
           let context = LAContext()
           // 設置取消按鈕標題
           context.localizedCancelTitle = "Cancel"
           // 宣告一個變數接收 canEvaluatePolicy 返回的錯誤
           var error: NSError?
           // 評估是否可以針對給定方案進行身份驗證
           if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
               // 描述使用身份辨識的原因
               let reason = "Log in to your account"
               // 評估指定方案
               context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { (success, error) in
                   if success {
                       DispatchQueue.main.async { [unowned self] in
                          print("aaaaa ::: \(success)")
                       }
                   } else {
                       DispatchQueue.main.async { [unowned self] in
                         YYxErrorHandler.printFailMsg(error?.localizedDescription)
                       }
                   }
               }
           } else {
            YYxErrorHandler.printFailMsg("")
           }
    }
}
