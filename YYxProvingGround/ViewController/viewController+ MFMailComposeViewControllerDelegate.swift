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
        let mailComposeViewController = MFMailComposeViewController.giveMeMFMailComposeViewControllerWithConfigration()
        mailComposeViewController.mailComposeDelegate = self
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else{
            print("Can't send email")
        }
    }
    
  
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        print("ttt")
        controller.dismiss(animated: true, completion: nil)

    }
}
