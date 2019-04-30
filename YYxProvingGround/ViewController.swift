//
//  ViewController.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/3/20.
//  Copyright © 2019年 002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var turnBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    var sideBar:SideBar?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        aa()
        let border: CAShapeLayer = CAShapeLayer()
        //線的顏色
        border.strokeColor = UIColor.black.cgColor
        //設置填充色
        border.fillColor = UIColor.darkGray.cgColor
        //虛線大小
        border.lineDashPattern = [3,3]
        //添加到layer
        self.view.layer.addSublayer(border)
        
        let path = UIBezierPath()
        // 添加路徑[1條點(100,100)到點(200,100)的線段]到path
        path.move(to: CGPoint(x:50, y:100))
        path.addLine(to: CGPoint(x:50, y:200))
        //添加路徑3
        border.path = path.cgPath
        
        let bezierAnimation = CABasicAnimation.init(keyPath: "strokeEnd")
        bezierAnimation.duration = 3
        bezierAnimation.fromValue = 0
        bezierAnimation.toValue = 1
        bezierAnimation.isRemovedOnCompletion = false
        
        border.add(bezierAnimation, forKey: nil)
        containerView.layer.addSublayer(border)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func cc() {
        
    }
    func aa()  {
//      self.sideBar =  SideBar(containerView: containerView, parentViewController: self, BundleButton: turnBtn)
//
//        self.sideBar!.isLoading.addObserver { [weak self] (isLoading) in
//            if isLoading {
//                self?.containerView.frame.origin.x = -20
//            } else {
//
//            }
//        }
    }
    @IBAction func turn(_ sender: Any) {
        sideBar?.turn()
    }
    
    

}
extension Int{
   
}
