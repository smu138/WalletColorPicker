//
//  WalletPageViewController.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//

import Foundation
import UIKit
import SnapKit
import PassKit

// используется для вывода данных с Page Controller-а
protocol WalletPageViewControllerOutput: AnyObject {
    //пока не требуется
    func closePageTapped(with page: WalletSinglePageModel)
    func openUrlTapped(with page: WalletSinglePageModel)
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
    
    private var topLabel: UILabel = {
        $0.text          = "Customize your style"
        $0.numberOfLines = 1
        $0.textAlignment = .left
        $0.lineBreakMode = .byTruncatingMiddle
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor     = .black
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        return $0
    }(UILabel())
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        //layout.estimatedItemSize = .init(width: 40, height: 40)//UICollectionViewFlowLayout.automaticSize
        //layout.itemSize = .init(width: 40, height: 40)// UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        //collectionView.setContentCompressionResistancePriority(.required, for: .horizontal)
        return collectionView
    }()
    
    private let vStackView: UIStackView = {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 8
        return $0
    }(UIStackView())
    
    private var descriptionLabel: UILabel = {
        $0.text          = "Customize your business card colours and style, create your corporate design"
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.lineBreakMode = .byWordWrapping
        $0.font = .systemFont(ofSize: 14)
        $0.textColor     = .black
        
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        return $0
    }(UILabel())
    
    let walletButton = PKAddPassButton(addPassButtonStyle: PKAddPassButtonStyle.black)

    private let closeButton: UIButton = {
        $0.setTitle("I'll do it later", for: .normal)
        //$0.setImage(AppAssets.catalogSectionHeaderSort.image, for: .normal)
        $0.contentEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
        //$0.tintColor = Palette.Text.contrast.color
        return $0
    }(UIButton(type: .system))

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
        containerView.addSubview(topLabel)
        containerView.addSubview(collectionView)
        
        vStackView.addArrangedSubview(descriptionLabel)
        vStackView.addArrangedSubview(walletButton)
        vStackView.setCustomSpacing(16, after: walletButton)
        vStackView.addArrangedSubview(closeButton)
        
        containerView.addSubview(vStackView)
        view.addSubview(containerView)
    }

    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(8)
        }

        topLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
        
        vStackView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
    }
    
    func setupActions() {
        walletButton.addTarget(self, action: #selector(walletButtonAction), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    }
    
    func applyStyles() { }
    
    func setupCollectionCircles(with page: WalletSinglePageModel) {
        collectionAdapter = WalletPagesAdapter(collectionView: collectionView)
        collectionAdapter?.updateCollection(with: page)
    }
}

extension WalletPageViewController {
    @objc func walletButtonAction() {
        output?.openUrlTapped(with: page)
    }
    
    @objc func closeButtonAction() {
        output?.closePageTapped(with: page)
    }
}
