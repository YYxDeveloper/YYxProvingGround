//
//  ViewContrller+Animation.swift
//  YYxProvingGround
//
//  Created by Young Lu on 2020/5/11.
//  Copyright © 2020 002. All rights reserved.
//

import Foundation
import UIKit


extension ViewController{
    //https://swift.gg/2017/04/20/quick-guide-animations-with-uiviewpropertyanimator/
    func exampleUIViewPropertyAnimator() {
        //        codeButton
        let animator = UIViewPropertyAnimator (
            duration: 1 ,
            dampingRatio: 0.4 ){ self.codeButton.center = CGPoint (x: 0 , y: 100 ) }
        animator.startAnimation(afterDelay: 0.5 )

    }
    func exampleUIViewPropertyAnimatorWithCompletion() {
        let animator = UIViewPropertyAnimator (duration: 2.0 , curve: .easeOut){
            self.codeButton.alpha = 0.2
            //以初始化為終點
            self.codeButton.transform = CGAffineTransform(scaleX: 1.6, y: 1).concatenating(CGAffineTransform(translationX: 0, y: 100))
        }
        animator.addAnimations{ self.codeButton.center = CGPoint (x: 0 , y: 0 ) };//以初始化為奇點
        animator.startAnimation()
        animator.addCompletion { (position) in
            //            position 參數是UIViewAnimatingPosition 類型，它用於表明動畫結束的位置，這個值本身是一個枚舉，包含了starting、end 和current。通常得到的值是end。
            print("Animation completed")
            switch position {
            case .start: break
            case .end: break
            case .current:break
                
                
            @unknown default:
                fatalError()
            }
        }

    }
    func exampleUIViewPropertyAnimatorRotate() {
        let animator = UIViewPropertyAnimator(duration: 5, curve: .linear) {[weak self] in
            guard let self = self else { return }
            self.codeButton.transform = CGAffineTransform(rotationAngle: .pi)
           }
        
        animator.addAnimations {[weak self] in
            guard let self = self else { return }
            self.codeButton.transform = self.codeButton.transform.rotated(by: .pi)
        }
        animator.startAnimation()
    }
}
