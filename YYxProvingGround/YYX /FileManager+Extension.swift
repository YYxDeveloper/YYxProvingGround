//
//  FileManager+Extension.swift
//  aaaaaw
//
//  Created by 002 on 2019/2/20.
//  Copyright © 2019年 002. All rights reserved.
//

import Foundation
enum fileType:String {
    case json,txt,plist
}
extension FileManager{
    
     //MARK: - to Bundle path
    func readJsonFileFromBundle(_ fileName: String) throws -> String{
        guard let pathForResource = Bundle.main.path(forResource: fileName, ofType: fileType.json.rawValue) else {
            YYxErrorHandler.printOptionFail();return String()
        }
        do {
            let content = try String(contentsOfFile: pathForResource, encoding: String.Encoding.utf8)
            return content
        } catch {
            throw error
        }
    }
    static func readArrayFromBundle(fileName:String)->[Any]{
        let url = Bundle.main.url(forResource: fileName, withExtension: fileType.plist.rawValue)!
        
        do {
            let soundsData = try Data(contentsOf: url)
            let arr = try PropertyListSerialization.propertyList(from: soundsData, options: [], format: nil)
                as! [Any]
            return arr
        } catch  {
            return [Any]()
        }
        
    }
    static func readDictionaryFromBundle(fileName:String)->[String:AnyObject]{
        var propertyListForamt =  PropertyListSerialization.PropertyListFormat.xml //Format of the Property List.
        var plistData: [String: AnyObject] = [:] //Our data
        let plistPath: String? = Bundle.main.path(forResource: fileName, ofType: fileType.plist.rawValue)! //the path of the data
        let plistXML = FileManager.default.contents(atPath: plistPath!)!
        do {//convert the data to a dictionary and handle errors.
            plistData = try PropertyListSerialization.propertyList(from: plistXML, options: .mutableContainersAndLeaves, format: &propertyListForamt) as! [String:AnyObject]
            return plistData
            
        } catch {
            YYxErrorHandler.printDoCatchErrorFail()
            return Dictionary()
        }
    }
     //MARK: - to Sandbox path
    static func writeUtf8TexttoSand(fileName:String,content:String,filetype:fileType){
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent("\(fileName).\(filetype.rawValue)")
            do {
                try content.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {YYxErrorHandler.printDoCatchErrorFail()}
        }
    }
    static func readUtf8TextFromSand(fileName:String,filetype:fileType) -> String {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent("\(fileName).\(filetype.rawValue)")
            do {
                print(fileURL)
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                return text2
            }
            catch {
                YYxErrorHandler.printDoCatchErrorFail()
               
            }
        }
         return String()
    }
    static func writeDictionaryToSand(nameFile:String,witchDictionary:[String:AnyObject]){
        let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let customPlistURL = docsBaseURL.appendingPathComponent("\(nameFile).plist")
        print(customPlistURL.absoluteString)
        do  {
            let data = try PropertyListSerialization.data(fromPropertyList: witchDictionary, format: PropertyListSerialization.PropertyListFormat.binary, options: 0)
            do {
                try data.write(to: customPlistURL, options: .atomic)
                print("Successfully write \n \(FileManager.giveMesSandboxPath())")
            }catch{
                print(error.localizedDescription)
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    static func writeArrayToSand<T:Codable>(nameFile:String,witchArray:[T]) {
        let docsBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let customPlistURL = docsBaseURL.appendingPathComponent("\(nameFile).plist")
        print(customPlistURL.absoluteString)
        // Swift Dictionary To Data.
        do  {
            let data = try PropertyListSerialization.data(fromPropertyList: witchArray, format: PropertyListSerialization.PropertyListFormat.xml, options: 0)
            do {
                try data.write(to: customPlistURL, options: .atomic)
                print("Successfully write \n \(FileManager.giveMesSandboxPath())")
            }catch{
                YYxErrorHandler.printDoCatchErrorFail();print(error.localizedDescription)
            }
        }catch (let err){
            print(err.localizedDescription)
        }
    }
    static func giveMesSandboxPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
    }
    // MARK: - about Jailbtoken
    static func isJailbtoken() -> Bool {
        
        #if targetEnvironment(simulator)
        return true
        #else
        
        // Check 1 : existence of files that are common for jailbroken devices
        if FileManager.default.fileExists(atPath: "/Applications/Cydia.app")
            || FileManager.default.fileExists(atPath: "/Library/MobileSubstrate/MobileSubstrate.dylib")
            || FileManager.default.fileExists(atPath: "/bin/bash")
            || FileManager.default.fileExists(atPath: "/usr/sbin/sshd")
            || FileManager.default.fileExists(atPath: "/etc/apt")
            || FileManager.default.fileExists(atPath: "/private/var/lib/apt/")
        {
            return true
        }
        // Check 2 : Reading and writing in system directories (sandbox violation)
        let stringToWrite = "Jailbreak Test"
        do
        {
            try stringToWrite.write(toFile:"/private/JailbreakTest.txt", atomically:true, encoding:String.Encoding.utf8)
            //Device is jailbroken
            return true
        }catch{
            return false
        }
        
        #endif
    }
}