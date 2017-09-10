//
//  UITableView+Extension.swift
//  appBase
//
//  Created by eddy on 2016/06/24.
//  Copyright © 2016年 eddy. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {

    // MARK: XIBの登録・取り出し XIBファイルとクラスを同じ名前にして利用してください。
    // http://qiita.com/tattn/items/647e094936287a6bd2d3
    // Ex:  tableView.registerCell(MyCell.self)
    //      tableView.registerCells([MyCell1.self, MyCell2.self])
    //      let cell = tableView.dequeueCell(MyCell.self)
    func registerCell<T: UITableViewCell>(_ type: T.Type) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func registerCells<T: UITableViewCell>(_ types: [T.Type]) {
        types.forEach { registerCell($0) }
    }
    
    func dequeueCell<T: UITableViewCell>(_ type: T.Type, indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
    }
}
