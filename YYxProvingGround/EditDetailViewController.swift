//
//  EditDetailViewController.swift
//  BurningNote
//
//  Created by young.lu on 2020/3/5.
//  Copyright © 2020 young.lu. All rights reserved.
//

import UIKit

class EditDetailViewController: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let timeZone = ["一小時","二小時","三小時","六小時","早上10點","晚上10點","一天","一禮拜","月底","半年","其他"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editCollectionView()
    }
    func editCollectionView()  {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
extension EditDetailViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return timeZone.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: DateSelectItem.self), for: indexPath) as? DateSelectItem else {
            return UICollectionViewCell()
        }
        cell.timeLabel.text = timeZone[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 30)
    }
}
