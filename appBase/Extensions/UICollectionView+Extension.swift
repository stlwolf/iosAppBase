//
//  UICollectionView+Extension.swift
//  appBase
//
//  Created by eddy on 2016/06/24.
//  Copyright © 2016年 eddy. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    // MARK: XIBの登録・取り出し XIBファイルとクラスを同じ名前にして利用してください。
    // http://qiita.com/tattn/items/647e094936287a6bd2d3
    // Ex:
    //    collectionView.registerCell(MyCell.self)
    //    collectionView.registerCells([MyCell1.self, MyCell2.self])
    //    let cell = collectionView.dequeueCell(MyCell.self)
    //    
    //    collectionView.registerReusableView(MyReusableView.self)
    //    collectionView.registerReusableViews([MyReusableView1.self, MyReusableView2.self])
    //    let view = collectionView.dequeueReusableView(type: MyReusableView.self, indexPath: indexPath)
    
    func registerCell<T: UICollectionViewCell>(type: T.Type) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        registerNib(nib, forCellWithReuseIdentifier: className)
    }
    
    func registerCells<T: UICollectionViewCell>(types: [T.Type]) {
        types.forEach { registerCell($0) }
    }
    
    func registerReusableView<T: UICollectionReusableView>(type: T.Type, kind: String = UICollectionElementKindSectionHeader) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        registerNib(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }
    
    func registerReusableViews<T: UICollectionReusableView>(types: [T.Type], kind: String = UICollectionElementKindSectionHeader) {
        types.forEach { registerReusableView($0, kind: kind) }
    }
    
    func dequeueCell<T: UICollectionViewCell>(type: T.Type, forIndexPath: NSIndexPath) -> T {
        return dequeueReusableCellWithReuseIdentifier(type.className, forIndexPath: forIndexPath) as! T
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(type: T.Type, indexPath: NSIndexPath, kind: String = UICollectionElementKindSectionHeader)
        -> T {
        return dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: type.className, forIndexPath: indexPath) as! T
    }
}