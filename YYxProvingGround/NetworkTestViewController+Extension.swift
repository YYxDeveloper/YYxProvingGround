//
//  NetworkTestViewController+Extension.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/23.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
extension NetworkTestViewController{
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
