//
//  UIView+Extension.swift
//  appBase
//
//  Created by eddy on 2016/06/24.
//  Copyright © 2016年 eddy. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // 子Viewを全て削除
    // http://qiita.com/tattn/items/647e094936287a6bd2d3
    // Ex: view.removeAllSubViews()
    func removeAllSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
}