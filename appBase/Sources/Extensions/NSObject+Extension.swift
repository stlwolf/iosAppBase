//
//  NSObject+Extension.swift
//  appBase
//
//  Created by eddy on 2016/06/24.
//  Copyright © 2016年 eddy. All rights reserved.
//

import Foundation

extension NSObject {
    
    // MARK: - クラス名の取得
    // http://qiita.com/tattn/items/647e094936287a6bd2d3
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
