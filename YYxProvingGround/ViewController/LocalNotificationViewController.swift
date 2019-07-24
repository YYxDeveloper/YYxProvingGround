//
//  ViewController.swift
//  LocalNotiDemo
//
//  Created by Amit Kumar Singh on 18/01/19.
//  Copyright © 2019 Amit Kumar Singh. All rights reserved.
//

import UIKit
import UserNotifications

class LocalNotificationViewController: UIViewController {

    let center = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Remove all delivered notificatios
        center.removeAllDeliveredNotifications()
    }

    @IBAction func buttonCreateNotification(_ sender: Any) {
        //creating the notification content
       center.sendLocalNotification()
    }
    
    @IBAction func buttonReadNotifications(_ sender: Any) {
        // Find list of Local Notification the app has already set
       center.getNotificationInfo()
    }
}

