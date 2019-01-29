//
//  AppInfoUtility.swift
//  CodeStore
//
//  Created by onewh on 2018/7/24.
//  Copyright © 2018年 onewh. All rights reserved.
//

import UIKit

open class AppInfoUtility: NSObject {

    @objc public static func appVersion() -> String {
        if let ver = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
            return ver
        }
        return ""
    }
    
    
}
