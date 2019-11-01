//
//  theCryptoSwift .swift
//  YYxProvingGround
//
//  Created by young.lu on 2019/10/31.
//  Copyright © 2019 002. All rights reserved.
//

import Foundation
import CryptoSwift
class EncryptionAES {
//
    // 暗号化処理
    // key:変換キー
    // iv:初期化ベクトル(時間などを使用してランダム生成するとよりセキュアになる)
    // text:文字列
    func encrypt(key: String, iv:String, text:String) -> String {

        do {
            // 暗号化処理
            // AES インスタンス化
            let aes = try AES(key: key, iv: iv)
            let encrypt = try aes.encrypt(Array(text.utf8))

            // Data 型変換
            let data = Data( encrypt )
            // base64 変換
            let base64Data = data.base64EncodedData()
            // UTF-8変換 nil 不可
            guard let base64String =
                String(data: base64Data as Data, encoding: String.Encoding.utf8)
                else { return "" }

            // base64文字列
            return base64String

        } catch {
            // エラー処理
            return ""
        }
    }

    // 複合処理
    // key:変換キー
    // iv:🤭(時間などを使用してランダム生成するとよりセキュアになる)
    // base64:文字列
    func decrypt(key: String, iv:String, base64:String) -> String {

        do {
            // AES インスタンス化
            let aes = try AES(key: key, iv:iv)

            // base64 から Data型へ
            let byteData = base64.data(using: String.Encoding.utf8)! as Data
            // base64 デーコード
            guard let data = Data(base64Encoded: byteData)
                else { return "" }

            // UInt8 配列の作成
            let aBuffer = Array<UInt8>(data)
            // AES 複合
            let decrypted = try aes.decrypt(aBuffer)
            // UTF-8変換
            guard let text = String(data: Data(decrypted), encoding: .utf8)
                else { return "" }

            return text
        } catch {
            // エラー処理
            return ""
        }
    }
}
extension String {
    
    /// AES加密
    ///
    /// - Parameters:
    ///   - key: key
    ///   - iv: iv
    /// - Returns: String
    func aesEncrypt(key: String, iv: String) -> String? {
        var result: String?
        do {
            // 用UTF8的编碼方式將字串轉成Data
            let data: Data = self.data(using: String.Encoding.utf8, allowLossyConversion: true)!
            
             let aecEnc = try AES(key: key, iv: iv)
            // 用AES的方式將Data加密
//            let aecEnc: AES = try AES(key: key, iv: iv, blockMode: .CBC)
            let enc = try aecEnc.encrypt(data.bytes)
            
            // 使用Base64編碼方式將Data轉回字串
            let encData: Data = Data(bytes: enc, count: enc.count)
            result = encData.base64EncodedString()
        } catch {
            print("\(error.localizedDescription)")
        }
        
        return result
    }
    
    /// AES解密
    ///
    /// - Parameters:
    ///   - key: key
    ///   - iv: iv
    /// - Returns: String
    func aesDecrypt(key: String, iv: String) -> String? {
        var result: String?
        do {
            // 使用Base64的解碼方式將字串解碼後再轉换Data
            let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0))!
            
            // 用AES方式將Data解密
             let aesDec = try AES(key: key, iv: iv)
//            let aesDec: AES = try AES(key: key, iv: iv, blockMode: .CBC)
            let dec = try aesDec.decrypt(data.bytes)
            
            // 用UTF8的編碼方式將解完密的Data轉回字串
            let desData: Data = Data(bytes: dec, count: dec.count)
            result = String(data: desData, encoding: .utf8)!
        } catch {
            print("\(error.localizedDescription)")
        }
        
        return result
    }
}
