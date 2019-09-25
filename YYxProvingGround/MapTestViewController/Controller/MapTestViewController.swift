//
//  ViewController.swift
//  AnimatingMapAnnotations
//
//  Created by Luke Smith on 01/06/2018.
//  Copyright © 2018 Luke Smith. All rights reserved.
//

import UIKit
import MapKit

class MapTestViewController: UIViewController {
    var locationManager = CLLocationManager()
    var lastLocation: CLLocation?
    var userLocationAnnotation: LSAnnotation?
    fileprivate let kDistanceFilter = 100.0 //minimum movement
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        preprocessInfoPlist()
        exampleGeoCoderAddressString()
        self.locationManager.delegate = self
        self.locationManager.activityType = .other
        self.locationManager.distanceFilter = 10
        self.mapView.showsUserLocation = true
        self.mapView.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addAnAnnotationAtTheUsersPosition() {
        if let location = self.lastLocation {
            if let annotation = self.userLocationAnnotation {
                annotation.coordinate = location.coordinate
            } else {
                self.userLocationAnnotation = LSAnnotation()
                self.userLocationAnnotation?.coordinate = location.coordinate
                self.mapView.addAnnotation(self.userLocationAnnotation!)
            }
        }
    }
}

//MARK: Map View Delegate
extension MapTestViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //only use a custom view if its a map annotation type - not users location, or search results.
        if let _ = annotation as? MKUserLocation {
            return nil
        }
        let reuseIdentifier = "annotation"
        var annotationView : LSAnnotationView?
        annotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier) as? LSAnnotationView
        if annotationView == nil {
            annotationView = LSAnnotationView.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
            annotationView?.frame = CGRect.init(x: 0, y: 0, width: 100, height: 100)
            //annotationView?.translatesAutoresizingMaskIntoConstraints = true
        }
        //annotationView?.setSizeLarge(false)
        return annotationView
    }
    private func mapViewRegionDidChangeFromUserInteraction() -> Bool {
        let view = self.mapView.subviews[0]
        //  Look through gesture recognizers to determine whether this region change is from user interaction
        if let gestureRecognizers = view.gestureRecognizers {
            for recognizer in gestureRecognizers {
                if (recognizer.state == UIGestureRecognizer.State.began || recognizer.state == UIGestureRecognizer.State.ended) {
                    return true
                }
            }
        }
        return false
    }
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        //set interaction timer so the map doesnt jump to current location while user is interacting.
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let location = CLLocation(latitude: self.mapView.centerCoordinate.latitude, longitude: self.mapView.centerCoordinate.longitude)
        self.lastLocation = location
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotationView = view as? LSAnnotationView else {
            return
        }
        annotationView.setSizeLarge(true)
    }
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        guard let annotationView = view as? LSAnnotationView else {
            return
        }
        annotationView.setSizeLarge(false)
    }
    /*
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Tapped")
        if let annotation = view.annotation as? GZSearchMapAnnotation, let author = self.viewModel.sessionManager.user {
            let gzLocation = GZLocation.init(annotation: annotation, author: author, layerId: nil, groupIds: nil)
            self.addLocationsView.annotation = annotation
            self.addLocationsView.location = gzLocation
            self.addLocationsView.viewMode = .enterDetails
            /*
             let postVC = GZPostViewController.init(nibName: "GZPostViewController", bundle: nil)
             postVC.sessionManager = self.viewModel.sessionManager
             postVC.annotation = annotation
             self.navigationController?.pushViewController(postVC, animated: true)
             self.addLocationsView.viewMode = .minimized
             */
            //let _ = GZPostViewController.presentPostVCFrom(controller: self, sessionManager: self.viewModel.sessionManager, annotation: annotation)
        }
    }*/
}

extension MapTestViewController: CLLocationManagerDelegate {
    // MARK: CLLocation Manager Delegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:        break
        case .denied:
            self.locationAccessDenied(status)
        case .restricted:
            self.locationAccessDenied(status)
        case .authorizedWhenInUse:
            self.locationAccessGranted()
        case .authorizedAlways:
            self.locationAccessGranted()
        }
    }
    fileprivate func locationAccessDenied(_ status: CLAuthorizationStatus) {
        self.mapView.delegate = nil
        locationManager.stopUpdatingLocation()
        // Need some UI to show that location services have not been allowed by user, they need to go to settings
        if status == .denied {
            self.lastLocation = nil
            if var topController = UIApplication.shared.keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                let alert = UIAlertController.init(title: NSLocalizedString("SettingsLocationNotEnabled", comment: ""), message: NSLocalizedString("SettingsLocationMessage", comment: ""), preferredStyle: .actionSheet)
                let settingsAction = UIAlertAction.init(title: NSLocalizedString("Settings", comment: ""), style: .default, handler: { (action) in
                    let urlForSettings: URL = URL(string:UIApplication.openSettingsURLString)!
                    if UIApplication.shared.canOpenURL(urlForSettings) {
                        UIApplication.shared.open(urlForSettings, options: [:], completionHandler: nil)
                    }
                })
                let cancelAction  = UIAlertAction.init(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil)
                alert.addAction(settingsAction)
                alert.addAction(cancelAction)
                
                topController.present(alert, animated: true) { //[weak weakSelf = self] in
                    /*
                     if weakSelf?.majorIndicator.isAnimating != nil {
                     weakSelf?.majorIndicator.stopAnimating()
                     UIView.animate(withDuration: AnimationSpeed.normal.rawValue, animations: {
                     weakSelf?.majorIndicator.alpha = 0
                     weakSelf?.majorLocationName.text? = "Your current address can't be found."
                     weakSelf?.disableSave()
                     })
                     }*/
                }
            }
        }
    }
    fileprivate func locationAccessGranted() {
        locationManager.requestLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location: CLLocation = locations.last {
            let viewRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 4000, longitudinalMeters: 4000)
            self.mapView.setRegion(viewRegion, animated: false)
            self.lastLocation = location
            self.addAnAnnotationAtTheUsersPosition()
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager failed, \(error.localizedDescription)")
    }
}

