//
//  UIImageViewController.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/7/22.
//  Copyright © 2019 002. All rights reserved.
//

import UIKit

class UIImageViewController: UIViewController {

    @IBOutlet weak var theImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()


      exampleGenerateQRCodeWithRedColor()
    }
 
    func exampleGenerateQRCodeWithRedColor()  {
       
         let myString = "https://pennlabs.org"
         theImageView.image = UIImage.giveMeQRCode(from: myString)
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
