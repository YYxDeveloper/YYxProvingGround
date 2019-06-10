//
//  Reachability+YYX.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/6/10.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import Reachability

extension Reachability{
    static func checkState(){
        let reachability = Reachability()!
        
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
}
