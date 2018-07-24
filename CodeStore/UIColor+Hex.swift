//
//  UIColor+Hex.swift
//  car
//
//  Created by 8891 on 2017/9/12.
//  Copyright © 2017年 myself. All rights reserved.
//

import Foundation

@objc
public
extension UIColor {
    
    static func hexColor(_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    static func hexColor(_ hex:String, alpha:CGFloat) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
    
    
    
    convenience init(hexRed: Int, hexGreen: Int, hexBlue: Int) {
        //        assert(hexRed >= 0 && hexRed <= 255, "Invalid red component")
        //        assert(hexGreen >= 0 && hexGreen <= 255, "Invalid green component")
        //        assert(hexBlue >= 0 && hexBlue <= 255, "Invalid blue component")
        if hexRed >= 0 && hexRed <= 255 , hexGreen >= 0 && hexGreen <= 255, hexBlue >= 0 && hexBlue <= 255{
            self.init(red: CGFloat(hexRed) / 255.0, green: CGFloat(hexGreen) / 255.0, blue: CGFloat(hexBlue) / 255.0, alpha: 1.0)
        }else{
            self.init(red: 0, green: 0, blue: 0, alpha: 1.0)
        }
    }
    
    convenience init(hexRed: Int, hexGreen: Int, hexBlue: Int, alpha:CGFloat) {
        //        assert(hexRed >= 0 && hexRed <= 255, "Invalid red component")
        //        assert(hexGreen >= 0 && hexGreen <= 255, "Invalid green component")
        //        assert(hexBlue >= 0 && hexBlue <= 255, "Invalid blue component")
        if hexRed >= 0 && hexRed <= 255 , hexGreen >= 0 && hexGreen <= 255, hexBlue >= 0 && hexBlue <= 255{
            self.init(red: CGFloat(hexRed) / 255.0, green: CGFloat(hexGreen) / 255.0, blue: CGFloat(hexBlue) / 255.0, alpha: 1.0)
        }else{
            self.init(red: 0, green: 0, blue: 0, alpha: alpha)
        }
    }
    
    convenience init(hex: Int) {
        self.init(
            hexRed: (hex >> 16) & 0xFF,
            hexGreen: (hex >> 8) & 0xFF,
            hexBlue: hex & 0xFF
        )
    }
    
    convenience init(hexString:String) {
        var cString:String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        var rgbValue:UInt32 = 0
        if ((cString.characters.count) != 6) {
            cString = "000000"
        }
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        let rgb:Int = Int(rgbValue)
        self.init(hexRed: rgb >> 16 & 0xFF, hexGreen: rgb >> 8 & 0xFF, hexBlue: rgb & 0xFF)
        
    }
    
}
