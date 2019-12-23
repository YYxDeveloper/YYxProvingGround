//
//  ReactRelationalViewController.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/12/23.
//  Copyright © 2019 002. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
class ReactRelationalViewController: UIViewController {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var indicateLabel: UILabel!
    let theViewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        theViewModel.sendEditValue(completion:{value in
            
            self.indicateLabel.text = String(value)
            
        })
      
    }
    @IBAction func chageSliderVlaue(_ sender: UISlider) {
        theViewModel.receiveNewValue(new: sender.value)
//        print((sender.value * 100).description)
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
