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
    
    let page: WalletSinglePage
    
    let containerView: UIView = {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 25
        return $0
    }(UIView())
    
    private let hStackView: UIStackView = {
        //$0.isUserInteractionEnabled = false
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
        $0.spacing = 8
        return $0
    }(UIStackView())
    
    
    
    init(with page: WalletSinglePage) {
        self.page = page

        super.init(nibName: nil, bundle: nil)
        
        setupView()
        setupConstraints()
        applyStyles()
        setupActions()
        
        createCircles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupView() {
        view.addSubview(containerView)
        containerView.addSubview(hStackView)
    }

    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }

        hStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func setupActions() { }
    
    func applyStyles() { }
    
}

private extension WalletPageViewController {
    func createCircles() {
        page.colorCircles.forEach { singleCircle in
            let circleView: WalletCircleView = {
                let singleCircleView = WalletCircleView(leftColor: singleCircle.leftColor, rightColor: singleCircle.rightColor, action: singleCircle.action)
                return singleCircleView
            }()
            
            circleView.snp.makeConstraints { make in
                make.width.height.equalTo(40).priority(999)
            }
            
            hStackView.addArrangedSubview(circleView)

        }
    }
}
