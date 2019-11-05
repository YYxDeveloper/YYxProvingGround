//
//  ViewController+3rd.swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/11/1.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
extension ViewController{
    func exampleCryptoSwift() {
        //http://ijecorp.blogspot.com/2013/08/python-m2crypto-aes-encrypt-decrypt.html
        //加密知識
        let key = "abcdefghijklmnop" // 128bit(16文字)のキーを入れる
              let iv =  "1234567890123456" // データをシフト演算するキー128bit(16文字)
              let json = "{\"id\":2,\"name\":\"ほげほげ君\",\"hobby\":\"ボルダリング\"}" // 暗号化・復号するjson

              // EncryptionAESのインスタンス化
              let aes = EncryptionAES()

              // jsonを暗号化
              let jsonEncrypted = try! aes.encrypt(key: key, iv: iv, text: json)
              print(jsonEncrypted)
              // -> PlOEf5oeBt2GsyWDHUk7OtOUV6nRPpYQvqE919jkrrpWaAvQc+IhkrO3gPmiNQbkQOLLXMlnQh5U2wbwEPYksg==

              // jsonを復号
              let jsonDecrypted = aes.decrypt(key: key, iv: iv, base64: jsonEncrypted)
              print(jsonDecrypted)
              // -> {"id":2,"name":"ほげほげ君","hobby":"ボルダリング"}
    }
}
