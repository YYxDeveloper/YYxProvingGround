//
//  ViewController.swift
//  UIAttachment&&UISnap
//
//  Created by max on 17.01.2020.
//  Copyright © 2020 max. All rights reserved.
//

import UIKit

class UIAttachmentBehaviorViewController: UIViewController, UIDynamicAnimatorDelegate {
    var squareView = UIView()
    var secondSmallView = UIView()
    var firstSmallView = UIView()
    var attachment: UIAttachmentBehavior?
    var goButton = UIButton()
    var animator = UIDynamicAnimator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator = UIDynamicAnimator(referenceView: view)
        animator.delegate = self
//        example_animation_attemp()
        example_animation_colisionWithBounce()
//        example_animtion_turnAround()
    }
    func example_animtion_turnAround() {
        createSquare()
        createFirstSmallView()
        squareView.turnAround(duration: 6)
    }
    func example_animation_colisionWithBounce() {
        createSquare()
//        createFirstSmallView()
//        createSecondSmallView()
        let gravityBehavior = UIGravityBehavior(items: [squareView])
        let collisionBehavior = UICollisionBehavior(items:  [squareView])
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true

        animator .addBehavior(gravityBehavior)
        animator.addBehavior(collisionBehavior)

        
      
        
    }
    func dynamicAnimatorDidPause(_ animator: UIDynamicAnimator) {
          UIView.animate(withDuration: 0.5, animations: {[unowned self] in
                  
                  let squareViewLocation = CGPoint(x: self.squareView.frame.origin.x, y: self.squareView.frame.origin.y - 20 )
                  self.squareView.frame = CGRect(origin: squareViewLocation,size: self.squareView.frame.size
                         )
              })
    }
    func dynamicAnimatorWillResume(_ animator: UIDynamicAnimator) {
        
    }
    func example_animation_attemp() {
        title = "Attachment"
        createSquare()
        createFirstSmallView()
        createSecondSmallView()
        createGestureRecorder()
        createCollisionAndAttachment()
        createdGoButton()
    }
    func createSquare() {
        squareView = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        squareView.center = view.center
        squareView.backgroundColor = .blue
        view.addSubview(squareView)
    }
    
    func createFirstSmallView() {
        firstSmallView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        firstSmallView.backgroundColor = .green
        squareView.addSubview(firstSmallView)
    }
    
    func createSecondSmallView() {
        secondSmallView = UIView(frame: CGRect(x: 120, y: 120, width: 20, height: 20))
        secondSmallView.backgroundColor = .red
        view.addSubview(secondSmallView)
    }
    //Сreate a pan gesture panning recorder
    func createGestureRecorder() {
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(gesture(param:)))
        view.addGestureRecognizer(gestureRecognizer)
    }
    //Create collisions and attachments
    func createCollisionAndAttachment() {
        animator = UIDynamicAnimator(referenceView: view)
        //collisions
        let collision = UICollisionBehavior(items: [squareView])
        collision.translatesReferenceBoundsIntoBoundary = true
        attachment = UIAttachmentBehavior(item: squareView,offsetFromCenter: UIOffset(horizontal: -40, vertical:-40), attachedToAnchor: secondSmallView.center)
        animator.addBehavior(collision)
        animator.addBehavior(attachment!)
    }
    func createdGoButton() {
        goButton = UIButton(type: .system)
        goButton.frame = CGRect(x: 170, y: 800, width: 80, height: 20)
        goButton.setTitle("NextVC", for: .normal)
        goButton.setTitleColor(.blue, for: .normal)
        goButton.addTarget(self, action: #selector(goNextVc(sender:)), for: .touchUpInside)
        view.addSubview(goButton)
    }
    
    
    // objc functions
    @objc func gesture(param: UIPanGestureRecognizer) {
        let tapPoint = param.location(in: view)
        print(tapPoint)
        attachment?.anchorPoint = tapPoint
        secondSmallView.center = tapPoint
    }
    @objc func goNextVc (sender: Any?) {
        
        
    }
    
    
}

