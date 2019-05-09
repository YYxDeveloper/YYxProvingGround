//
//  ViewCOntroller+extension.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/9.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit
//------------
//https://stackoverflow.com/questions/37442593/custom-operator-to-simplify-if-let
infix operator ?=
func ?= <T>( left: inout T, right: T?) {
    if let right = right {
        left = right
    }
}

// overload to deal with an optional left handed side
func ?= <T>( left: inout T?, right: T?) {
    if let right = right {
        left = right
    }
}
//---------
extension ViewController{
    func eampleDecodeJsonDatabyUtf8() {
        do {
            //PlistDictionaryExample
            let ss = try FileManager.default.readJsonFileFromBundle("UserInformationsJsonExample").data(using: .utf8)
            
            ss~!.decodeJsonDatabyUtf8(modelType: UserInformations.self, compelete: {data in
                print(data)
                
            })
            
        } catch  {
            print(error)
        }
    }
    func exampleMVVMBindingForInstance()  {
        self.cookingTimer.start()
        self.cookingTimer.countingTime.addObserver{ [weak self] (timeStr,sec) in
            //            print("!!\(timeStr)")
            //             print("!!@\(sec)")
            
            
        }
    }
    //
    func exampleCreateOwnDynamicTableViewController()   {
        let vc = PresenterInTableViewController()
        
        self.addSubViewWithChildController(addSubViewController: vc, toWitchView: view)
        
    }
}
