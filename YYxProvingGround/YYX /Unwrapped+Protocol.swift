//
//  Unwrapped+Protocol.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/4/2.
//  Copyright © 2019年 002. All rights reserved.
//

import Foundation
protocol Unwrappedable {
    static var defaultValue: Self { get }
}

extension Optional where Wrapped: Unwrappedable {
    var unwrappedValue: Wrapped { return self ?? Wrapped.defaultValue }
}

extension Int: Unwrappedable {
    static var defaultValue: Int { return 0 }
}
extension Double: Unwrappedable {
    static var defaultValue: Double { return 0.0 }
}
extension Float: Unwrappedable {
    static var defaultValue: Float { return 0.0 }
}
extension String: Unwrappedable {
    static var defaultValue: String { return "" }
}

extension Array: Unwrappedable {
    static var defaultValue: Array<Element> { return [] }
}
