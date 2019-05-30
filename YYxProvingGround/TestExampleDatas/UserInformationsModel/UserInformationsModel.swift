//
//  DriverModel.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/7.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation

class UserInformations: Codable {
    let userProfiles:[userProfile]
}
class userProfile: Codable {
//    "name":"John",
//    "age":30,
//    "cars":[ "Ford", "BMW", "Fiat" ]
    let name:String
    let age:String
    let cars:[String]
}
