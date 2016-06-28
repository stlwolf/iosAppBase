//
//  UIView+Extension.swift
//  appBase
//
//  Created by eddy on 2016/06/24.
//  Copyright © 2016年 eddy. All rights reserved.
//

import Foundation
import UIKit

enum FadeType: NSTimeInterval {
    case
    Normal = 0.2,
    Slow = 1.0
}

extension UIView {
    
    // 子Viewを全て削除
    // http://qiita.com/tattn/items/647e094936287a6bd2d3
    // Ex: view.removeAllSubViews()
    func removeAllSubviews() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
    }
    
    // フェードイン・フェードアウトアニメ
    // Ex: 
    //      let view = UIView()
    //      view.fadeIn(.Slow)
    //      // 完了タイミングで何かしたい場合はクロージャーも記述
    //      view.fadeIn(type: .Slow) { [weak self] in
    //          self?.someMethod()
    //         }
    func fadeIn(type: FadeType = .Normal, completed: ( ()->() )? = nil) {
        fadeIn(type.rawValue, completed)
    }
    
    /** For typical purpose, use "public func fadeIn(type: FadeType = .Normal, completed: (() -> ())? = nil)" instead of this */
    func fadeIn(duration: NSTimeInterval = FadeType.Slow.rawValue, _ completed: ( ()->() )? = nil) {
        alpha = 0
        hidden = false
        UIView.animateWithDuration(duration,
            animations: {
                self.alpha = 1
            }) { finished in
                completed?()
        }
    }
    
    func fadeOut(type: FadeType = .Normal, completed: ( ()->() )? = nil) {
        fadeOut(type.rawValue, completed)
    }
    
    /** For typical purpose, use "public func fadeOut(type: FadeType = .Normal, completed: (() -> ())? = nil)" instead of this */
    func fadeOut(duration: NSTimeInterval = FadeType.Slow.rawValue, _ completed: ( ()->() )? = nil) {
        UIView.animateWithDuration(duration,
            animations: {
                self.alpha = 1
            }) { [weak self] finished in
                self?.hidden = true
                self?.alpha = 1
                completed?()
        }
    }
    
}