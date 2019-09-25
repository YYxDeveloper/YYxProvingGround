//
//  UIView_Extensions.swift
//  Ask
//
//  Created by Luke Smith on 07/02/2018.
//  Copyright © 2018 LukeSmith. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func autolayoutIntoSuperview() {
        guard let superview = self.superview else {
            print("=== Unable to add view into superview - no superview exists")
            return
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: superview.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: superview.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.bottomAnchor).isActive = true
    }
}

//protocol PresentsOnTop {
//}

extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
}
