//
//  CustomAnnotationView.swift
//  AnimatingMapAnnotations
//
//  Created by Luke Smith on 01/06/2018.
//  Copyright © 2018 Luke Smith. All rights reserved.
//

import Foundation
import MapKit
import UIKit

class LSAnnotationView: MKAnnotationView {
    @IBOutlet weak var mainContent: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var animatingViewHeight: NSLayoutConstraint!
    @IBOutlet weak var animatingViewWidth: NSLayoutConstraint!
    var animTime : TimeInterval = 0.5
    let smallWidth : CGFloat = 60
    let smallHeight : CGFloat = 60
    let largeWidth : CGFloat = 200
    let largeHeight : CGFloat = 200
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.loadNib()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init (coder)")
    }
    func loadNib() {
        print("*** loading nib ***")
        Bundle.main.loadNibNamed("LSAnnotationView", owner: self, options: nil)
        self.addSubview(self.mainContent)
        self.mainContent.autolayoutIntoSuperview()
        self.mainContent.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setSizeLarge(_ large: Bool) {
        var width = self.smallWidth
        var height = self.smallHeight
        if large {
            width = self.largeWidth
            height = self.largeHeight
        }
        self.animatingViewHeight.constant = height
        self.animatingViewWidth.constant = width
        //let yPos : CGFloat = (height / 2)
        UIView.animate(withDuration: 2.0, animations: {
            self.containerView.setNeedsLayout()
        })
    }
    /*
    override func layoutSubviews() {
        super.layoutSubviews()
        bounds = containerView!.bounds
    }
    override func prepareForReuse() {
        super.layoutSubviews()
        bounds = containerView!.bounds
        
    }*/
}
