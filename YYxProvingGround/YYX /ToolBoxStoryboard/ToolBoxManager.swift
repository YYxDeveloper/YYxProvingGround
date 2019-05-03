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
    static func giveMeStaticTableViewController(witchTypeViewController:witchTypeViewController) -> UITableViewController{
        if let tableViewController = UIViewController.giveMeViewControllerFromStoryBoard(storyBoardName: ToolBoxManager.storyboardID, storyBoardID: witchTypeViewController.rawValue) as? UITableViewController{
            return tableViewController
        }else{
            YYxErrorHandler.printOptionFail()
            return UITableViewController()
        }
    }
//    static func giveMeStaticCollectionViewController(witchTypeViewController:witchTypeViewController) -> uicollecvewc{
//        if let tableViewController = UIViewController.giveMeViewControllerFromStoryBoard(storyBoardName: ToolBoxManager.storyboardID, storyBoardID: witchTypeViewController.rawValue) as? UITableViewController{
//            return tableViewController
//        }else{
//            YYxErrorHandler.printOptionFail()
//            return UITableViewController()
//        }
//        
//    }
}
