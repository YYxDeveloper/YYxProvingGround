//
//  NetworkTestViewController+Extension.swift
//  YYxProvingGround
//
//  Created by young lu on 2019/5/23.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import Network
import UIKit
import Reachability
import Moya
extension NetworkTestViewController{
    func exampleNWMonitor() {
       NWPathMonitor().checkNetworkStatus()

    }
    func exampleGetGoogleSheetJson() {
        //GoogleSheetTestExportAPI
//        https://spreadsheets.google.com/feeds/cells/15pzC6KoPDVApwTp1U3LdVXCoDByOm_Be_cloYW7K-1Q/1/public/values?alt=json
        
        
        //New Toeic高分單字大全 [有聲書]:突破900分得分策略
//        https://spreadsheets.google.com/feeds/cells/1TPbwOmsAHzmV9sNjminUouhIuNbKCdtUOFmU6Ru529c/1/public/values?alt=json
        let url = String(format: "https://spreadsheets.google.com/feeds/cells/1TPbwOmsAHzmV9sNjminUouhIuNbKCdtUOFmU6Ru529c/1/public/values?alt=json")
        let serviceUrl = URL(string: url)
        var request = URLRequest(url: serviceUrl!)
        
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
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
    func exampleReachability() {
        Reachability.checkState()
    }
    func exampleTestURLconnect()  {
        CheckMan.checkDefaultRequestData(urlString: "https://my-json-server.typicode.com/YYxDeveloper/FakeAPI/posts", completion: {data in
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
    // MARK: - Sheetsu ex
    func exampleSheetsu_Create1User()  {
       /**
         why use resume
        https://medium.com/@apppeterpan/%E7%82%BA%E4%BB%80%E9%BA%BC-urlsessiontask-%E8%A6%81%E5%91%BC%E5%8F%AB-resume-%E6%89%8D%E6%9C%83%E5%95%9F%E5%8B%95-27e0aaba57ef
         
        */
        
        // Adds single row to spreadsheet
        let url = String(format: "https://sheetsu.com/apis/v1.0su/10b85fba966d")
        let serviceUrl = URL(string: url)
        let parameterDictionary = ["id" : "33", "name" : "1Glenn", "score": "999"]
        var request = URLRequest(url: serviceUrl!)
        request.setDefaultSetting(body: parameterDictionary, witchHttpMethod: .POST)
        
        let session = URLSession.giveMeURLSession()
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
    func exampleSheetSu_Read() {
        // Read whole spreadsheet
        
        /**
         By default, always the first sheet (aka worksheet aka tab) is accessed.
         To access other sheets within a spreadsheet add /sheets/{sheet_name} path to the URL if using cURL, or pass appropriate param when using a lib.
         */
//        let url = String(format: "https://sheetsu.com/apis/v1.0su/10b85fba966d/sheets/B")
         let url = String(format: "https://sheetsu.com/apis/v1.0su/10b85fba966d")
        let serviceUrl = URL(string: url)
        var request = URLRequest(url: serviceUrl!)
        
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
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
    func sheetsuReadAnotherSheet(){
        //        https://sheetsu.com/apis/v1.0su/10b85fba966d?offset=40
        /**
         sheetsu: each sheet only read 50 rows
         & chinese code is UTF-16
         
         
         */
        let url = String(format: "https://sheetsu.com/apis/v1.0su/10b85fba966d/sheets/D")
        let serviceUrl = URL(string: url)
        var request = URLRequest(url: serviceUrl!)
        
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        
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
    // MARK: - Moya ex
    func exampleMoyaBasic() {
        
    }
}
