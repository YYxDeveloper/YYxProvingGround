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

    
}
