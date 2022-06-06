//
//  WalletPageViewController.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//

import Foundation
import UIKit
import SnapKit

// используется для вывода данных с Page Controller-а
protocol WalletPageViewControllerOutput: AnyObject {
    //пока не требуется
}

class WalletPageViewController: UIViewController {
    
    // MARK: - Class Variables
    
    weak var output: WalletPageViewControllerOutput?
    
    let page: WalletSinglePageModel //поддержка pageViewController
    private var collectionAdapter: WalletPagesAdapter?
    
    // MARK: - UI Components
    
    private let containerView: UIView = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 25
        return $0
    }(UIView())
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    // MARK: - Class Initializers
    
    init(with page: WalletSinglePageModel, output: WalletPageViewControllerOutput?) {
        self.page = page
        self.output = output
        
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
}

// MARK: - UI Setup

extension WalletPageViewController {
    func setupView() {
        view.addSubview(containerView)
        containerView.addSubview(collectionView)
    }

    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
        }

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupActions() { }
    
    func applyStyles() { }
    
    func setupCollectionCircles(with page: WalletSinglePageModel) {
        collectionAdapter = WalletPagesAdapter(collectionView: collectionView)
        collectionAdapter?.updateCollection(with: page.colorCircles)
    }
}
