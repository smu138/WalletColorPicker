//
//  WalletPageViewController.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//

import Foundation
import UIKit
import SnapKit


class WalletPageViewController: UIViewController {
    
    let page: WalletSinglePageModel //поддержка pageViewController
    private var collectionAdapter: WalletPagesAdapter?
    
    private let containerView: UIView = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 25
        return $0
    }(UIView())
    
//    private let hStackView: UIStackView = {
//        //$0.isUserInteractionEnabled = false
//        $0.axis = .horizontal
//        $0.alignment = .center
//        $0.distribution = .equalSpacing
//        $0.spacing = 8
//        return $0
//    }(UIStackView())
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    init(with page: WalletSinglePageModel) {
        self.page = page

        super.init(nibName: nil, bundle: nil)
        
        setupView()
        setupConstraints()
        applyStyles()
        setupActions()
        
        setupCollectionCircles(with: page)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupView() {
        view.addSubview(containerView)
        containerView.addSubview(collectionView)
    }

    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupActions() { }
    
    func applyStyles() { }
    
}

private extension WalletPageViewController {
    func setupCollectionCircles(with page: WalletSinglePageModel) {
        collectionAdapter = WalletPagesAdapter(collectionView: collectionView)
        collectionAdapter?.updateCollection(with: page.colorCircles)
        
        
//        page.colorCircles.forEach { singleCircle in
//
//            let circleView: WalletCircleCell = {
//
//                let singleCircleView = WalletCircleCell(colorsData: singleCircle.dataForView, action: singleCircle.action)
//                return singleCircleView
//            }()
//
//            circleView.snp.makeConstraints { make in
//                make.width.height.equalTo(50).priority(999)
//            }
//
//            hStackView.addArrangedSubview(circleView)
//        }
        
        
    }
}
