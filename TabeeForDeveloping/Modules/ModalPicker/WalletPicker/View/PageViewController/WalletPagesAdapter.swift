//
//  WalletPagesAdapter.swift
//  TabeeForDeveloping
//
//  Created by Serg on 05.06.2022.
//

import Foundation
import UIKit

final class WalletPagesAdapter: NSObject {

    weak var collectionView: UICollectionView!
    
    var walletCircles: [WalletSinglePageModel.ColorCircle] = []
    
    init(collectionView: UICollectionView) {
        super.init()
        
        self.collectionView = collectionView
        
        configureCollectionView()
    }
 
    // MARK: - Configure collection
    func configureCollectionView() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(WalletCircleCell.self, forCellWithReuseIdentifier: WalletCircleCell.reuseId)

        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .clear
        
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.clipsToBounds = true
    }
    
    func updateCollection(with walletCircles: [WalletSinglePageModel.ColorCircle]) {
        self.walletCircles = walletCircles
        
        collectionView.reloadData()
    }
    
}

// MARK: - Collection Delegate
extension WalletPagesAdapter: UICollectionViewDelegate { }


// MARK: - Collection DataSource

extension WalletPagesAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        walletCircles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalletCircleCell.reuseId, for: indexPath) as? WalletCircleCell
        else {
            return UICollectionViewCell()
        }
        
        let model = walletCircles[indexPath.row]
        cell.configure(colorsData: model.dataForView, action: model.action)

       return cell

    }
}
