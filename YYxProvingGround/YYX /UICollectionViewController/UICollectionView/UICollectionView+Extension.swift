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
    static let YYxCollectionViewCell = "CategoryHorizenTalRowCell"
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
    func giveMeCategoryHorizenTalRowCell(witchIdentifier:String = UICollectionView.YYxCollectionViewCell,indexPatht:IndexPath) -> CategoryHorizenTalRowCell{
            let cell = self.dequeueReusableCell(withReuseIdentifier: witchIdentifier, for: indexPatht) as! CategoryHorizenTalRowCell
        cell.titleLabel.text = "gggg"
        cell.backgroundColor = .blue
        return cell
    }
    
}
