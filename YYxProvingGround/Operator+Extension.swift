//
//  Operator+Extension.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/10/22.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
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
extension Suit: CaseIterable {}
enum Suit: String {
    case spades = "♠"
    case hearts = "♥"
    case diamonds = "♦"
    case clubs = "♣"
}

//
