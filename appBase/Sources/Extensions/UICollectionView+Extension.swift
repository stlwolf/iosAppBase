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
    
    func registerCell<T: UICollectionViewCell>(_ type: T.Type) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    func registerCells<T: UICollectionViewCell>(_ types: [T.Type]) {
        types.forEach { registerCell($0) }
    }
    
    func registerReusableView<T: UICollectionReusableView>(_ type: T.Type, kind: String = UICollectionElementKindSectionHeader) {
        let className = type.className
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }
    
    func registerReusableViews<T: UICollectionReusableView>(_ types: [T.Type], kind: String = UICollectionElementKindSectionHeader) {
        types.forEach { registerReusableView($0, kind: kind) }
    }
    
    func dequeueCell<T: UICollectionViewCell>(_ type: T.Type, forIndexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: type.className, for: forIndexPath) as! T
    }
    
    func dequeueReusableView<T: UICollectionReusableView>(_ type: T.Type, indexPath: IndexPath, kind: String = UICollectionElementKindSectionHeader)
        -> T {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: type.className, for: indexPath) as! T
    }
}
