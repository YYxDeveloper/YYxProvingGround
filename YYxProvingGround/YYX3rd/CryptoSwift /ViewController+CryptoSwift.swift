//
//  ViewController+CryptoSwift.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/11/12.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import UIKit
import CryptoSwift
extension ViewController{
    //https://www.hangge.com/blog/cache/detail_1870.html
    
    //CryptoSwift還提供了ChaCha20、Rabbit、Blowfish這三種加密算法，它們同上文介紹的AES一樣都是對稱加密算法。而且用法也差不多，加密時都需要提供一個密鑰（key）和一個密鑰偏移量（iv
    func exampleAESCryptoSwift() {
        //http://ijecorp.blogspot.com/2013/08/python-m2crypto-aes-encrypt-decrypt.html
       //加密知識
        
        
        do {
            let key = "abcdefghijklmnop" // 128bit(16文字)のキーを入れる
            let iv =  "1234567890123456" // データをシフト演算するキー128bit(16文字)
            let json = try FileManager.default.readJsonFileFromBundle("HttpsTestPostExample") // 暗号化・復号するjson

            // EncryptionAESのインスタンス化
            let aes = EncryptionAES()

            // jsonを暗号化
            let jsonEncrypted =  aes.encrypt(key: key, iv: iv, text: json)
            print(jsonEncrypted)
            
            FileManager.default.writeUtf8TexttoSand(fileName: "ccc", content: jsonEncrypted, filetype: .txt)
            print(FileManager.default.giveMesSandboxPath())
            
            
            // jsonを復号
            let jsonDecrypted = aes.decrypt(key: key, iv: iv, base64: jsonEncrypted)
            print(jsonDecrypted)
        } catch  {
            
        }
    }
    func exampleChaCha20() {
        do {
            let str = "欢迎访问 hangge.com"
            print("原始字符串：\(str)")
             
            let key = "hangge.com123456hangge.com123456"
            print("key密钥：\(key)")
             
            let iv = "12345678"
            print("密钥偏移量：\(iv)")
             
            //使用ChaCha20加密模式
            let chiper = try ChaCha20(key: key.bytes, iv: iv.bytes)
             
            //开始加密
            let encrypted = try chiper.encrypt(str.bytes)
            print("加密结果(base64)：\(encrypted.toBase64()!)")
             
            //开始解密
            let decrypted = try chiper.decrypt(encrypted)
            print("解密结果：\(String(data: Data(decrypted), encoding: .utf8)!)")
        } catch {
            
        }
    }
    func exampleDecodeWithAES() {
           FileManager.default.decodeJsonDatabyUtf8FromBundle(fileName: "UserInformationsJsonExample", modelType: UserInformations.self, compelete: { data in
                    _ = data.userProfiles.map({data in
                        data.key = "dogisfundogisfun"
                        print(data.encrypName~!)
                        
                    })
                
                   
              })
       }
   

}
