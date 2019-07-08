//
//  ViewTestViewController.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/6/11.
//  Copyright © 2019 002. All rights reserved.
//

import UIKit

class ViewTestViewController: YYxViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        exampleStaticCollectionViewController()
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
    func exampleStaticCollectionViewController()  {
        let vc = ToolBoxManager.giveMeStaticCollectionViewController()
        addSubViewWithChildController(addSubViewController: vc, toWitchView: self.view)
        
    }

}
extension ViewTestViewController:UICollectionViewDelegate{
    
}
