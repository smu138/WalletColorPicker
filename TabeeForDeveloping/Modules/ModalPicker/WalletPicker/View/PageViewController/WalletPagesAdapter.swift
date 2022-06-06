//
//  WalletPagesAdapter.swift
//  TabeeForDeveloping
//
//  Created by Serg on 05.06.2022.
//

import Foundation
import UIKit

protocol WalletPagesAdapterOutput: AnyObject {
    func cellTapped(with circle: WalletSinglePageModel.ColorCircle)
}

final class WalletPagesAdapter: NSObject {

    weak var collectionView: UICollectionView!
    weak var output: WalletPagesAdapterOutput?

    var model: WalletSinglePageModel!
    
    init(collectionView: UICollectionView, delegate: WalletPagesAdapterOutput) {
        super.init()
        
        self.collectionView = collectionView
        self.output = delegate
        
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
        
        collectionView.alwaysBounceHorizontal = false
        collectionView.alwaysBounceVertical = false
        
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.clipsToBounds = true
    }

    func updateCollection(with model: WalletSinglePageModel) {
        self.model = model
        
        collectionView.reloadData()
    }
    
}

// MARK: - Collection Delegate
extension WalletPagesAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //если понадобится- то будет работать этот делегат для коллекции тоже (например для отправки аналитики)
        //print("selected")
 
        output?.cellTapped(with: model.colorCircles[indexPath.row])
    }
}


// MARK: - Collection DataSource

extension WalletPagesAdapter: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.colorCircles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WalletCircleCell.reuseId, for: indexPath) as? WalletCircleCell
        else {
            return UICollectionViewCell()
        }

        let circle = model.colorCircles[indexPath.row]
        cell.configure(with: circle)

       return cell

    }
}
