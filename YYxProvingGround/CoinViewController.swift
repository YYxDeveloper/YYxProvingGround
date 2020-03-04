//
//  CoinViewController.swift
//  YYxProvingGround
//
//  Created by young.lu on 2020/3/3.
//  Copyright © 2020 002. All rights reserved.
//

import UIKit
import CoreMotion
import RxSwift
import RxCocoa
class CoinViewController: UIViewController {
    let  motionManager = CMMotionManager()
    let motionQueue = OperationQueue()
    
    var disposeBag = DisposeBag() // 来自父类 ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        exmpleRXNotificationBinding()
        //      exampleRoundoffDecimalNumber()
        //       exampleConvertToDegreed()
//        exampleCoreMotionManager()
        
    }
    func handle(_ motion: CMDeviceMotion?) {
        
        let x = motion?.gravity.x ?? 0.0
        
        let y = motion?.gravity.y ?? 0.0
        
        if fabs(Float(y)) >= fabs(Float(x)) {
            
            if y >= 0 {
                
                // UIDeviceOrientationPortraitUpsideDown
                
                print("頭向下")
            } else {
                
                // UIDeviceOrientationPortrait
                
                print("豎屏")
            }
        } else {
            
            if x >= 0 {
                
                // UIDeviceOrientationLandscapeRight
                
                print("頭向右")
            } else {
                
                // UIDeviceOrientationLandscapeLef
                
                print("頭向左")
            }
        }
        
    }
    ///https://developer.apple.com/documentation/foundation/decimal/roundingmode-vau
    func exampleRoundoffDecimalNumber()  {
        //        let aa:Double = -0.000181
        //             let cc =  String(format: "%.5f",aa)
        //         print(cc)
        
        let scale = 6
        var value1 = Decimal(-0.0832999999999999999)
        var value2 = Decimal(0.0832199999999999999)
        var roundedValue1 = Decimal()
        var roundedValue2 = Decimal()
        NSDecimalRound(&roundedValue1, &value1, scale, NSDecimalNumber.RoundingMode.plain)
        
        NSDecimalRound(&roundedValue2, &value2, scale, NSDecimalNumber.RoundingMode.plain)
        print(roundedValue1) // returns 0.0833
        print(roundedValue2) // returns 0.0832
    }
    func exampleCoreMotionManager() {
        motionManager.startDeviceMotionUpdates(to: motionQueue) { deviceMotion, error in
            guard let motion = deviceMotion else { return }
            
            
            print(motion)
            
            //         Dispatch gravity updates to main queue, since they affect UI.
            DispatchQueue.main.async {
                //                      self.gravity.gravityDirection = CGVector(dx: gravity.x * 3.5,
                //                                                               dy: -gravity.y * 3.5)
                
                self.handle(motion)
                
            }
        }
    }
    func exampleConvertToDegreed()  {
        
        let number:Double = -0.000181
        let cc = number * (180 / .pi)
        print(cc)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        //https://www.hackingwithswift.com/example-code/uikit/how-to-respond-to-the-device-being-shaken
        print("Device was shaken!")
    }
    override func becomeFirstResponder() -> Bool {
        return true
    }
    func exmpleRXNotificationBinding() {
        let notificationName = Notification.Name(UIDevice.orientationDidChangeNotification.rawValue)
        
        NotificationCenter.default.rx.notification(notificationName)
            //            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { data in
                guard let aa = data.object as? UIDevice else{return}
                
                print(aa.orientation.rawValue)
            })
            .disposed(by: disposeBag)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
