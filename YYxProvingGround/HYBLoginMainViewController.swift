//
//  LoginMainViewController.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/8/21.
//  Copyright © 2019 002. All rights reserved.
//

import UIKit
/**
    - 1.圖片全部設定為2pt 所以根據文檔px格式全都除以2做轉換，三位數以上個位數會四捨五入
 
 
 */
class HYBLoginMainViewController: YYxScrollViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let boardView = UIView()
        
        #if DEBUG
            boardView.backgroundColor = .blue
        #endif
        boardView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollContainerView.addSubview(boardView)
        if #available(iOS 11, *) {
            let guide = view.safeAreaLayoutGuide
            boardView.topAnchor.constraint(equalToSystemSpacingBelow: guide.topAnchor, multiplier: 1.0).isActive = true

         
            
        } else {
            boardView.topAnchor.sameAsTopAnchor(withView: scrollContainerView,marginSpace: 20).isActive = true
        }
        
        if #available(*, iOS 6){
            //不支援NSLayoutConstraint
        }
        
       
        NSLayoutConstraint.activate([
            boardView.leadingAnchor.sameAsLeadingAnchor(withView: scrollContainerView),
            boardView.trailingAnchor.sameAsTrailingAnchor(withView: scrollContainerView),
            boardView.heightAnchor.constraint(equalToConstant: 180)
            
            ])

    }


}
