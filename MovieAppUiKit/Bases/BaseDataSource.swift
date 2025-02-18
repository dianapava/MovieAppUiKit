//
//  DataSource.swift
//  MovieAppUiKit
//
//  Created by Diana Pava Avila on 27/01/25.
//
import UIKit

protocol DataSourceDelegate: AnyObject {
    func data(with Index: Int)
}

class BaseDataSource<Data, Cell: BaseCollectionViewCell<Data>>: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    private var data: [Data] = []
    
    weak var dataSourceDelegate: (any DataSourceDelegate)?
    
    private let cellIdentifier: String
    
    init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
    
    func set(data: [Data]) {
        self.data = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? Cell else  {
            return UICollectionViewCell()
        }

        cell.setup(data: data[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        dataSourceDelegate?.data(with: indexPath.row)
    }
}
