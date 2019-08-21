//
//  ViewController.swift
//  UIScrollView Programmatically
//
//  Created by Andrea Toso on 09/02/2019.
//  Copyright © 2019 Andrea Toso. All rights reserved.
//

import UIKit
/**
 Relation files
 UIScreen+Extension
 
 
 */
class YYxScrollViewController: UIViewController {

    let scrollView = UIScrollView()
    let scrollContainerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupViews()
        
        view.backgroundColor = .green
        scrollView.backgroundColor = .purple
    }
    override func viewDidLayoutSubviews() {
        scrollViewContentSizeUpdate()
    }
  
    override func viewDidAppear(_ animated: Bool) {
        scrollViewContentSizeUpdate()

    }
    func setupScrollView(){
    
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scrollView)
        scrollView.addSubview(scrollContainerView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollContainerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scrollContainerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        scrollContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollContainerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupViews(){
//        scrollContainerView.addSubview(label1)
//        label1.centerXAnchor.constraint(equalTo: scrollContainerView.centerXAnchor).isActive = true
//        label1.topAnchor.constraint(equalTo: scrollContainerView.topAnchor).isActive = true
//        label1.widthAnchor.constraint(equalTo: scrollContainerView.widthAnchor, multiplier: 3/4).isActive = true
    }
//    let label1: UILabel = {
//        let label = UILabel()
//        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut culpa qui officia deserunt mollit anim id est laborum.............."
//        label.numberOfLines = 0
//        label.sizeToFit()
//        label.textColor = UIColor.white
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    func scrollViewContentSizeUpdate()  {
//        print("scrollContainerView :: \(updatedHeight)")

    }
    

}

