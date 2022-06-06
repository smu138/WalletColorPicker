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
    
    private var topLabel: UILabel = {
        $0.text          = "Customize your style"
        $0.numberOfLines = 1
        $0.textAlignment = .left
        $0.lineBreakMode = .byTruncatingMiddle
        $0.font = .boldSystemFont(ofSize: 16)
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
        //$0.isUserInteractionEnabled = false
        $0.axis = .vertical
        $0.alignment = .center
        $0.distribution = .fill
        $0.spacing = 8
        return $0
    }(UIStackView())
    
    private var descriptionLabel: UILabel = {
        $0.text          = "Customize your business card colours and style, create your corporate design"
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.lineBreakMode = .byWordWrapping
        $0.font = .boldSystemFont(ofSize: 14)
        $0.textColor     = .black
        
        $0.setContentCompressionResistancePriority(.required, for: .vertical)
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        return $0
    }(UILabel())
    
    private let walletButton: UIButton = {
        $0.setTitle("Закрыть модалку", for: .normal)
        //$0.setImage(AppAssets.catalogSectionHeaderSort.image, for: .normal)
        $0.contentEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
        //$0.tintColor = Palette.Text.contrast.color
        return $0
    }(UIButton(type: .system))
    
    private let closeButton: UIButton = {
        $0.setTitle("Закрыть модалку", for: .normal)
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
        
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(walletButton)
        containerView.addSubview(closeButton)
        
        //containerView.addSubview(vStackView)
        view.addSubview(containerView)
    }

    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            //make.height.equalTo(50)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(8)
            //make.centerY.equalToSuperview()
        }

        topLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(topLabel.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)//.priority(999)
            //make.bottom.equalTo(vStackView.snp.top)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            //make.height.equalTo(56).priority(999)
        }
        
        walletButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            //make.height.equalTo(56).priority(999)
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(walletButton.snp.bottom)
            //make.height.equalTo(56).priority(999)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
//        vStackView.snp.makeConstraints { make in
//            make.top.equalTo(collectionView.snp.bottom)//.offset(16)
//            make.leading.trailing.equalToSuperview()
//            //make.height.equalTo(150).priority(999)
//            make.bottom.equalToSuperview()//.inset(8)
//        }
    }
    
    func setupActions() {
        //button.addTarget(self, action: #selector(buttonActionHandler(_:)), for: .touchUpInside)
    }
    
    func applyStyles() { }
    
    func setupCollectionCircles(with page: WalletSinglePageModel) {
        collectionAdapter = WalletPagesAdapter(collectionView: collectionView)
        collectionAdapter?.updateCollection(with: page.colorCircles)
    }
}
