//
//  ViewController+FileManager.swift
//  YYxProvingGround
//
//  Created by 呂子揚 on 2019/8/5.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit
import WebKit

extension ViewController{
    func exampleReadHTMLFile()  {
        hideContainerView()
        //source:https://html-online.com/editor/'
        do {
            let fileContent = try  FileManager.default.readHTMLFileToString("HTMLTextTestFile")
//            print(fileContent)
            let webview = WKWebView()
            webview.frame  = view.bounds
            webview.loadHTMLString(fileContent, baseURL: nil)
//            webview.loadHTMLString(FakeDataManager.htmlContent(), baseURL: nil)
           
           webview.changeBackgroundColor(toWitchColor: .orange)
            self.view.addSubview(webview)
            
        } catch  {
            print(error)
        }
    }

}

