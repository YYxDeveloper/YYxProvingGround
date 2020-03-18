//
//  UIColor+Extension.swift
//  IX
//
//  Created by 002 on 2019/2/21.
//  Copyright © 2019年 IXCG. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{
    static func giveRGBColor(red:CGFloat,green:CGFloat,blue:CGFloat,opcity:Double)->UIColor{
        return UIColor(red: red/RGB_MAX, green: green/RGB_MAX, blue: blue/RGB_MAX, alpha: 0.3)
    }
    static func giveMeUIColorByHex (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    func convertColorToImage() -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(self.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    func convertToHexString() -> String {
        var r:CGFloat = 0
           var g:CGFloat = 0
           var b:CGFloat = 0
           var a:CGFloat = 0
           
           getRed(&r, green: &g, blue: &b, alpha: &a)
           
           let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
           
           return NSString(format:"#%06x", rgb) as String
    }
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
                 let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                 let scanner = Scanner(string: hexString)
                 if (hexString.hasPrefix("#")) {
                     scanner.scanLocation = 1
                 }
                 var color: UInt32 = 0
                 scanner.scanHexInt32(&color)
                 let mask = 0x000000FF
                 let r = Int(color >> 16) & mask
                 let g = Int(color >> 8) & mask
                 let b = Int(color) & mask
                 let red   = CGFloat(r) / 255.0
                 let green = CGFloat(g) / 255.0
                 let blue  = CGFloat(b) / 255.0
                 self.init(red:red, green:green, blue:blue, alpha:alpha)
             }
    convenience init(red: Int, green: Int, blue: Int) {
             assert(red >= 0 && red <= 255, "Invalid red component")
             assert(green >= 0 && green <= 255, "Invalid green component")
             assert(blue >= 0 && blue <= 255, "Invalid blue component")

             self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

}
