//
//  viewController+ MFMailComposeViewControllerDelegate.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/8/12.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import MessageUI

extension ViewController:MFMailComposeViewControllerDelegate{
    func exampleSendEmail() {
        
        sendEmail()
    }
    func sendEmail()  {
        //必須確定一定要有原生郵件app才能send
        let mailComposeViewController = MFMailComposeViewController.giveMeMFMailComposeViewControllerWithConfigration()
        mailComposeViewController.mailComposeDelegate = self
        if MFMailComposeViewController.canSendMail(){
            //要在viewWillApear才能呼叫
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else{
            print("Can't send email")
        }
    }
    
  
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        //要加cancal案案件才能動
        controller.dismiss(animated: true, completion: nil)

    }
}
