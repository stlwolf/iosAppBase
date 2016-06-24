//
//  UIApplication+Extension.swift
//  appBase
//
//  Created by eddy on 2016/06/24.
//  Copyright © 2016年 eddy. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    // MARK: 最前面のUIViewControllerを取得
    // http://qiita.com/tattn/items/647e094936287a6bd2d3
    // Ex: UIApplication.sharedApplication().topViewController()?
    func topViewController() -> UIViewController? {
        
        guard var topViewController = UIApplication.sharedApplication().keyWindow?.rootViewController else {
            return nil
        }
        
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        
        return topViewController
    }
}