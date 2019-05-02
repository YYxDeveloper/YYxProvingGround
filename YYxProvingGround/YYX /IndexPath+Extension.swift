//
//  IndexPath+Extension.swift
//  YYxProvingGround
//
//  Created by 002 on 2019/5/2.
//  Copyright © 2019年 002. All rights reserved.
//

import Foundation

extension IndexPath{
    func isOutOfArrayRange(withcArray:Array<Any>) -> Bool {
        return self.row > withcArray.count ? true : false
    }
}
