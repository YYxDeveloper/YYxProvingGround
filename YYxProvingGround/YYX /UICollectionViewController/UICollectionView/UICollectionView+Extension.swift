//
//  UICollectionView+Extension.swift
//  CollectionViewWithStoryboard
//
//  Created by 002 on 2019/3/13.
//  Copyright © 2019年 frank.chen. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView{
    static let YYxCollectionViewCell = "YYxCollectionViewCell"
    static func giveMeEmptyUICollectionView()->UICollectionView{
        return UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
    }
    func preprocess(registerNibClassName:String) {
        self.register(UINib.giveMeTheNib(witchNibName: registerNibClassName), forCellWithReuseIdentifier: registerNibClassName)
    }
    func preprocessWithYYxCell(registerNibClassName:String = UICollectionView.YYxCollectionViewCell) {
        self.register(UINib.giveMeTheNib(witchNibName: registerNibClassName), forCellWithReuseIdentifier: registerNibClassName)
    }
    
    /**
     need preprocess first
     */
    func giveMeYYxCollectionViewCell(witchIdentifier:String = UICollectionView.YYxCollectionViewCell,indexPatht:IndexPath) -> YYxCollectionViewCell{
            let cell = self.dequeueReusableCell(withReuseIdentifier: witchIdentifier, for: indexPatht) as! YYxCollectionViewCell
        cell.titleLabel.text = "gggg"
        cell.backgroundColor = .blue
        return cell
    }
    
}
