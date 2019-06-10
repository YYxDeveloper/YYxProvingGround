//
//  NetworkTestViewController+Extension.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/23.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import Reachability
extension NetworkTestViewController{
    func exampleReachability() {
        Reachability.checkState()
    }
    func exampleTestURLconnect()  {
        requestData(urlString: "https://my-json-server.typicode.com/YYxDeveloper/FakeAPI/posts", completion: {data in
            YYxErrorHandler.printTestLog(witchStep: 1, message: data.convertToUTF8String())
        })
    }
    func examplePostData() {
        
        let url = URL(string: "https://my-json-server.typicode.com/YYxDeveloper/FakeAPI/posts")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
         request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // insert json data to the request
        do {
            let theData:Data? = try FileManager.default.readJsonFileFromBundle("HttpsTestPostExample").data(using: .utf8)
             request.httpBody = theData
        } catch  {
            print("a")
        }
       
       
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            YYxErrorHandler.printTestLog(witchStep: 33, message: data.convertToUTF8String())
//            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//            if let responseJSON = responseJSON as? [String: Any] {
//                print(responseJSON)
//            }
        }
        
        task.resume()
    }
    
}
extension NetworkTestViewController{
    func exampleSheetsu_Create1User()  {
       
        
        // Adds single row to spreadsheet
        let url = String(format: "https://sheetsu.com/apis/v1.0su/10b85fba966d")
        let serviceUrl = URL(string: url)
        let parameterDictionary = ["id" : "6", "name" : "Glenn", "score": "44"]
        var request = URLRequest(url: serviceUrl!)
        
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: [])
        
        request.httpBody = httpBody
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            }.resume()
    }
}
