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
    static let CategoryHorizontalRowCell = "CategoryHorizenTalRowCell"
    static func giveMeEmptyUICollectionView()->UICollectionView{
        return UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
    }
    func preprocess(registerNibClassName:String) {
        self.register(UINib.giveMeTheNib(witchNibName: registerNibClassName), forCellWithReuseIdentifier: registerNibClassName)
    }
    func preprocessWithYYxCell(registerNibClassName:String = UICollectionView.CategoryHorizontalRowCell) {
        self.register(UINib.giveMeTheNib(witchNibName: registerNibClassName), forCellWithReuseIdentifier: registerNibClassName)
    }
    /**
     need preprocess first
     */
    func giveMeCategoryHorizenTalRowCell(witchIdentifier:String = UICollectionView.CategoryHorizontalRowCell,indexPatht:IndexPath) -> CategoryHorizenTalRowCell{
        
            let cell = self.dequeueReusableCell(withReuseIdentifier: witchIdentifier, for: indexPatht) as! CategoryHorizenTalRowCell
        
        
        return cell
    }
    
}
