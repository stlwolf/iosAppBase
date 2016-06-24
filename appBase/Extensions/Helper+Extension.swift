//
//  Helper+Extension.swift
//  appBase
//
//  Created by eddy on 2016/06/24.
//  Copyright © 2016年 eddy. All rights reserved.
//

import Foundation
import UIKit

protocol StoryBoardHelper {}

extension StoryBoardHelper where Self: UIViewController {
    
    // StoryboardのViewControllerを生成
    // http://qiita.com/tattn/items/647e094936287a6bd2d3
    // Ex:
    //      MyViewController.instantiate()                  << Storyboardファイルとクラスが同じ名前の場合
    //      MyViewController.instantiate("MyStoryboard")
    static func instantiate() -> Self {
        let storyBoard = UIStoryboard(name: self.className, bundle: nil)
        return storyBoard.instantiateViewControllerWithIdentifier(self.className) as! Self
    }
    
    static func instantiate(storyboard: String) -> Self {
        let storyBoard = UIStoryboard(name: storyboard, bundle: nil)
        return storyBoard.instantiateViewControllerWithIdentifier(self.className) as! Self
    }
}

extension UIViewController: StoryBoardHelper {}

protocol NibHelper {}

extension NibHelper where Self: UIView {
    
    // XIBのViewを生成
    // http://qiita.com/tattn/items/647e094936287a6bd2d3
    // ※ XIBファイルとクラスは同じ名前にしてください。
    // Ex: MyView.instantiate(owner: self)
    static func instantiate() -> Self {
        let nib = UINib(nibName: self.className, bundle: nil)
        return nib.instantiateWithOwner(nil, options: nil)[0] as! Self
    }
}

extension UIView: NibHelper {}

