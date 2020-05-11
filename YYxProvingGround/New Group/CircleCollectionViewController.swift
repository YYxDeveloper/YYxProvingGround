//
//  CircleCollectionViewController.swift
//  YYxProvingGround
//
//  Created by Young Lu on 2020/5/8.
//  Copyright © 2020 002. All rights reserved.
//

import UIKit
//http://www.cocoachina.com/cms/wap.php?action=article&id=16784
class CircleCollectionViewController: UICollectionViewController {
    var cellCount = 10
      
      public lazy var cellHeight:[CGFloat] = { //changed private to public
          var arr:[CGFloat] = []
          for _ in 0..<self.cellCount {
              arr.append(CGFloat(arc4random() % 150 + 40))
          }
          return arr
      }()
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = CircleLayout()
               collectionView?.collectionViewLayout = layout
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//extension CircleCollectionViewController: WaterFallLayoutDelegate {
//    func heightForItemAtIndexPath(indexPath: IndexPath) -> CGFloat {
//        return cellHeight[indexPath.row]
//    }
//}

extension CircleCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellCount
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {//偶数
            cellCount -= 1
            cellHeight.remove(at: indexPath.row)
            collectionView.performBatchUpdates({
                collectionView.deleteItems(at: [indexPath])
                }, completion: nil)
        } else {
            cellCount += 1
            cellHeight.append(CGFloat(arc4random() % 150 + 40))
            
            collectionView.performBatchUpdates({
                collectionView.insertItems(at: [indexPath])
            }, completion: nil)
        }
    }
    

}
