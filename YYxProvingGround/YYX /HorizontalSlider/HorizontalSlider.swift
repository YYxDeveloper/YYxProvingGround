//
//  ViewController.swift
//  CollectionView-Programmatic
//
//  Created by chris  on 8/5/18.
//  Copyright © 2018 kuronuma studios. All rights reserved.
//

import UIKit

class HorizontalSlider: UICollectionViewController {
   
    let cellId = "HorizontalSliderCell"
    let horizontalModel = 1
    static  func giveMeHorizontalSlider() -> HorizontalSlider {
        let emptyFlowlayout = UICollectionViewFlowLayout()
        return HorizontalSlider(collectionViewLayout: emptyFlowlayout)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
   
    func setupHorizontalSlider()  {
        collectionView?.register(CategoryVerticalColumnCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.backgroundColor = .red
    }
    func reloadDataWhenCellPress() {
        func cleanAllBackgroudColor(){
            
        }
        
        cleanAllBackgroudColor()
        collectionView.reloadData()
    }
    

}

extension HorizontalSlider:UICollectionViewDelegateFlowLayout{
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return horizontalModel
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryVerticalColumnCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CategoryVerticalColumnCell
        
        
        reloadDataWhenCellPress()
    }
}


