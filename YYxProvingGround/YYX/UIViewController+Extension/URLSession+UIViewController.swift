//
//  URLSession+UIViewController.swift
//  web test
//
//  Created by 002 on 2018/11/11.
//  Copyright © 2018年 002. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    func requestData(urlString:String, completion:@escaping ((_ data:Data)->())) {
        let defaultSession = URLSession(configuration: .default)
        
        var dataTask: URLSessionDataTask?
        dataTask?.cancel()
        
        dataTask = defaultSession.dataTask(with: URL(string: urlString)!) { data, response, error in
            defer { dataTask = nil }
            guard let data = data, let response = response as? HTTPURLResponse else {
                if let error = error{
                  YYxErrorHandler.printFailMsg(error.localizedDescription)
                }
                return
            }
            if response.statusCode == 200 {}
            completion(data)
            
            
        }
        dataTask?.resume()
        
    }
}
