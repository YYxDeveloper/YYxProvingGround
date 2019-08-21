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
        
    }
    
    func scrollViewContentSizeUpdate()  {
        let updatedHeight = scrollContainerView.frame.size.height
        print("scrollContainerView :: \(updatedHeight)")

    }
    

}

