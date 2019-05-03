//
//  ToolBoxManager.swift
//  YYxSwift_Button
//
//  Created by 002 on 2019/3/6.
//  Copyright © 2019年 young lu. All rights reserved.
//

import Foundation
import UIKit

class ToolBoxManager {
    enum witchTypeViewController :String{
        case StaticTableViewController
        case ToolBoxViewController
        case StaticCollectionViewController
    }
    static let storyboardID = "ToolBox"
    static func giveMeStaticTableViewController() -> UITableViewController{
        if let tableViewController = UIViewController.giveMeViewControllerFromStoryBoard(storyBoardName: ToolBoxManager.storyboardID, storyBoardID: witchTypeViewController.StaticTableViewController.rawValue) as? UITableViewController{
            return tableViewController
        }else{
            YYxErrorHandler.printOptionFail()
            return UITableViewController()
        }
    }
    static func giveMeToolBoxViewController() -> UIViewController{
        if let viewController = UIViewController.giveMeViewControllerFromStoryBoard(storyBoardName: ToolBoxManager.storyboardID, storyBoardID: witchTypeViewController.ToolBoxViewController.rawValue) as? UIViewController{
            return viewController
        }else{
            YYxErrorHandler.printOptionFail()
            return UIViewController()
        }
    }

}
