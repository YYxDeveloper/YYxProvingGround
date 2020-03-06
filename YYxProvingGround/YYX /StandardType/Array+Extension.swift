//
//  Array+Extension.swift
//  IX
//
//  Created by 002 on 2019/2/20.
//  Copyright © 2019年 IXCG. All rights reserved.
//

import Foundation
extension Array{
    static func whoExist<T: Equatable>(item:T, inArray:[T]) -> Bool
    {
        var index:Int = 0
        var found = false
        
        while (index < inArray.count && found == false)
        {
            if item == inArray[index]
            {
                found = true
            }
            else
            {
                index = index + 1
            }
        }
        return found == true ? true : false
    }
    
}
extension Array  where Element: SignedInteger {
    func giveMeHighestInt() -> Element{
        return  self.reduce(self.first, { $0! > $1 ? $0 : $1 }) ?? 0
    }
    func giveMeLowestInt() -> Element{
        return  self.reduce(self.first, { $0! < $1 ? $0 : $1 }) ?? 0
    }
}
extension Array{
    ///Check Array contain object not nil when getting object by index
    func checkContainElement()->Bool{
        if self.contains(where: {$0 != nil}) {
            return false
        }else{
            return true
        }
    }
}
