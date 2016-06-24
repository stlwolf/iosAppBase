//
//  UIColor+Extension.swift
//  appBase
//
//  Created by eddy on 2016/06/24.
//  Copyright © 2016年 eddy. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    // MARK: 16進数でUIColorの作成
    // http://qiita.com/tattn/items/647e094936287a6bd2d3
    // Ex: let color = UIColor.color(0xAABBCC)
    convenience init(hex: Int, alpha: Double = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: CGFloat(alpha))
    }
}