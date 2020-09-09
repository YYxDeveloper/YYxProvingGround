//
//  YYxMapViewController.swift
//  YYxProvingGround
//
//  Created by Young Lu on 2020/8/31.
//  Copyright © 2020 002. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import SnapKit

//左下角起點逆時針
let parkBorderCoordinate:[CLLocationCoordinate2D] =
    [
        CLLocationCoordinate2D(latitude: 25.026104, longitude: 121.557475),
        CLLocationCoordinate2D(latitude: 25.025970, longitude: 121.559101),
        CLLocationCoordinate2D(latitude: 25.027041, longitude: 121.559099),
        CLLocationCoordinate2D(latitude: 25.027070, longitude: 121.558253)
    ]

/**
 https://hiking.biji.co/index.php?q=review&act=info&review_id=5989
 
 大家都知道地球是一個橢圓形的構造，以周長來說，赤道最長，大約是40075公里，被切成360個經度(東經180度+西經180度)，則每個經度的寬度大約是111.32公里(40075公里/360度)，則:
 (1).若取到小數第5位，則誤差值約為  1.11 公尺
 (2).若取到小數第4位，則誤差值約為 11.1 公尺
 (3).若取到小數第3位，則誤差值約為 111 公尺
 (4).若取到小數第2位，則誤差值約為   1.1 公里
 (5).若取到小數第1位，則誤差值約為   11 公里

 台灣本島大約位於北緯22度到25度之間，每一個經度的距離大約是101公里到103公里之間，若取中間值102公里來算，小數第5位的值約為1.02公尺，因此在提供座標值時，其實應該要到小數第５位較為合適，誤差比較少。
 
 
 
 */
class YYxMapViewController: UIViewController {
    
    let testAddresses = ["臺北市中正區延平南路96號","臺北市文林路235號"]
    let homeCoordinate  = CLLocationCoordinate2D(latitude: 25.025913, longitude: 121.557058)
    let homeAddress = "台北市信義區信安街93號6樓"
    
    //信義活動中心
    //台北市信義區信義路五段106號
    //25.032097, 121.566761
    let testCoordinate = CLLocationCoordinate2D(latitude: 25.032097, longitude: 121.566761)
    let testAddress = "台北市信義區信義路五段106號"
    @IBOutlet weak var theMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        example_CreateCoordinateByAddrres()
//        example_ConvertAddrresToCoordinate()
      example_Create1MKPointAnnotation()
        
      
        
    }
    @IBAction func action1(_ sender: Any) {
        let annotation = MKPointAnnotation()
        annotation.title = "home"
        annotation.subtitle = homeAddress
        annotation.coordinate = homeCoordinate
        theMapView.showAnnotations([annotation], animated: true)

//        theMapView.selectAnnotation(annotation, animated: true)
    }
    
    
    
}


extension YYxMapViewController{
    struct planceModel:Codable {
        let name:String
        let address:String
        let phone:String
        let comment:String
    }
}
//example
extension YYxMapViewController{
    func example_Create1MKPointAnnotation() {
        let annotation = MKPointAnnotation()
        annotation.title = "信義活動中心"
        annotation.subtitle = testAddress
        annotation.coordinate = testCoordinate
        
        theMapView.showAnnotations([annotation], animated: true)
        theMapView.selectAnnotation(annotation, animated: true)
    }
    func example_CreateCoordinateByAddrres() {
        locationAddress()
    }
    func example_ConvertAddrresToCoordinate() {
//        let stationAddress1 = testAddress[0]
//        convertAddrresToCoordinate(address: stationAddress1)
        

        let geocoder = CLGeocoder()
       
        
        geocoder.geocodeAddressString(testAddress) {
            placemarks, error in
            let placemark = placemarks?.first
//            let lat = placemark?.location?.coordinate.latitude
//            let lon = placemark?.location?.coordinate.longitude
            
            guard let location = placemark?.location else {return}
            print("yyx location Lat: \(location.coordinate.latitude), Lon: \(location.coordinate.longitude)")
        }
        
    }
    
}


extension YYxMapViewController{
    //https://medium.com/%E5%BD%BC%E5%BE%97%E6%BD%98%E7%9A%84-swift-ios-app-%E9%96%8B%E7%99%BC%E6%95%99%E5%AE%A4/mapkit%E7%B6%93%E7%B7%AF%E5%BA%A6%E8%BD%89%E6%8F%9B%E5%9C%B0%E5%9D%80-9fe365f6c610
    //for iOS 11.0
    func geocode(latitude: Double, longitude: Double, completion: @escaping (CLPlacemark?, Error?) -> ())  {
        //1
        let locale = Locale(identifier: "zh_TW")
        let loc: CLLocation = CLLocation(latitude: latitude, longitude: longitude)
        if #available(iOS 11.0, *) {
            CLGeocoder().reverseGeocodeLocation(loc, preferredLocale: locale) { placemarks, error in
                guard let placemark = placemarks?.first, error == nil else {
                    UserDefaults.standard.removeObject(forKey: "AppleLanguages")
                    completion(nil, error)
                    return
                }
                completion(placemark, nil)
            }
        }
    }
    func locationAddress(){
        
        //CLGeocoder地理編碼 經緯度轉換地址位置
        geocode(latitude: testCoordinate.latitude, longitude: testCoordinate.longitude) { placemark, error in
            guard let placemark = placemark, error == nil else { return }
            // you should always update your UI in the main thread
            DispatchQueue.main.async {
                //  update UI here
                print("address1:", placemark.thoroughfare ?? "")
                print("address2:", placemark.subThoroughfare ?? "")
                print("city:",     placemark.locality ?? "")
                print("state:",    placemark.administrativeArea ?? "")
                print("zip code:", placemark.postalCode ?? "")
                print("country:",  placemark.country ?? "")
                print("placemark",placemark)
                
            }
        }
    }
    
    //https://toyo0103.github.io/2015/03/12/swift-IOS%E5%9C%B0%E5%9C%96%E9%81%8B%E7%94%A8-6-%E9%80%8F%E9%81%8ECLGeocoder%E8%BD%89%E6%8F%9B%E7%B6%93%E7%B7%AF%E5%BA%A6%E8%88%87%E5%9C%B0%E5%9D%80/
    //地址轉經緯度(geocodeAddressString)
    func convertAddrresToCoordinate(address:String) {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("", completionHandler: {(placeMarks, error)  in
            
            if error != nil{
                print(error)
                return
            }
            
            guard let marks = placeMarks else {return}
          
            print(marks)
            
        })

    }
 
    
    
}
