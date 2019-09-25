//
//  MapTestViewController+Extension.swift
//  YYxProvingGround
//
//  Created by 呂子揚 on 2019/9/25.
//  Copyright © 2019 002. All rights reserved.
//
import MapKit
import Foundation
extension MapTestViewController{
    func exampleGeoCoderAddressString() {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("台灣台北信安街93號6樓", completionHandler: {
            placeMarks,err  in
            
//            print("\(placeMarks)")
            print((placeMarks?[0].location?.coordinate)!)
            
        })
    }
}
