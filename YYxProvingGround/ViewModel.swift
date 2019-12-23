//
//  ViewModel.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/12/23.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import Combine
 @available(iOS 13.0, *)
class ViewModel {
    var sliderValue = Float()
    var theModel = Model()
    private var changeValue: ((Float)->Void)?
    
    lazy var observer = Subscribers.Assign(object: theModel, keyPath: \.sliderValue)
    let publisher = PassthroughSubject<Float, Never>()
    init() {
        publisher.subscribe(observer)
    }

    func receiveNewValue(new:Float) {
        publisher.send(new * 100)
//        print("ccc::\(theModel.sliderValue)")
         self.changeValue?(self.theModel.sliderValue)
    }
    func sendEditValue(completion: @escaping (Float)->()) {
       changeValue  = completion
        completion(theModel.sliderValue)
    }
}
