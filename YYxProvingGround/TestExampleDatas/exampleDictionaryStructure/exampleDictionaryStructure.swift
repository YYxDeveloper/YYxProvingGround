//
//  Item.swift
//  OurGymProvingGround
//
//  Created by young lu on 2019/5/29.
//  Copyright © 2019 young lu. All rights reserved.
//
import CryptoSwift
import Foundation
class EachPartItems: Codable {
    let part:[String:EachItem]
    
}
class EachItem: Codable {
    let English:String
    let Chinese:String
    let uuid:String
    
    
}
