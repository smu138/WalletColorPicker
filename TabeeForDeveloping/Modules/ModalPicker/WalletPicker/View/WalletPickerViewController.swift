//
//  WalletPickerViewController.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit
import FloatingPanel

final class WalletPickerViewController: UIViewController {
    
    // MARK: - Properties
    
    private let containerView: UIView = {
        $0.backgroundColor = .magenta
//        $0.layer.cornerRadius = Constraints.buttonHeight / 2
//        $0.layer.shadowColor = Palette.Background.basisDark.color.cgColor
//        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
//        $0.layer.masksToBounds = false
        return $0
    }(UIView())
    
    
    private let vStackView: UIStackView = {
       //$0.isUserInteractionEnabled = false
        $0.axis = .vertical
        $0.distribution = .fillProportionally
        $0.alignment = .center
        $0.spacing = 16
        return $0
    }(UIStackView())
    
    private var descriptionLabel: UILabel = {
        $0.text          = "Здесь какое-то описание и текст и еще что то там"
        $0.numberOfLines = 0
        $0.textAlignment = .left
        $0.lineBreakMode = .byTruncatingMiddle
        //$0.font          = FontBook.regular.of(style: .body)
        //$0.textColor     = Palette.Text.contrast.color
        $0.setContentCompressionResistancePriority(.required, for: .horizontal)
        return $0
    }(UILabel())
    
    private let button: UIButton = {
        $0.setTitle("Закрыть модалку", for: .normal)
        //$0.setImage(AppAssets.catalogSectionHeaderSort.image, for: .normal)
        $0.contentEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
        //$0.tintColor = Palette.Text.contrast.color
        return $0
    }(UIButton(type: .system))
    
    
    
    var output: WalletPickerViewOutput!
    
    // MARK: - UI Components
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
        setupActions()
        
        output.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        output.viewWillAppear()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        applyStyles()
    }
}

// MARK: - WalletPickerViewInput

extension WalletPickerViewController: WalletPickerViewInput {
    func setupInitialState(_ viewState: WalletPickerDataFlow.View.ViewState) { }
}

// MARK: - Setup

private extension WalletPickerViewController {
    
    func setupViews() {
        view.addSubview(containerView)
        containerView.addSubview(vStackView)
        vStackView.addArrangedSubview(descriptionLabel)
        vStackView.addArrangedSubview(button)
    }
    
    func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        vStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupActions() {
        button.addTarget(self, action: #selector(buttonActionHandler(_:)), for: .touchUpInside)
    }
    
    
    func applyStyles() {
        
    }
}

// MARK: - Constants

private extension WalletPickerViewController {
    struct Constraints { }
}

extension WalletPickerViewController {
    @objc func buttonActionHandler(_ button: UIButton) {
        print("tapped - closing modal")
    }
}

class IntrinsicPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .full
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelIntrinsicLayoutAnchor(absoluteOffset: 0, referenceGuide: .safeArea)
            //.half: FloatingPanelIntrinsicLayoutAnchor(fractionalOffset: 0.5, referenceGuide: .safeArea),
        ]
    }
    
    func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
            switch state {
            case .full: return 0.3
            default: return 0.0
            }
    }
}


class CustomPanelBehavior: FloatingPanelBehavior {
    let springDecelerationRate = UIScrollView.DecelerationRate.fast.rawValue + 0.02
    let springResponseTime = 0.4
    func shouldProjectMomentum(_ fpc: FloatingPanelController, to proposedTargetPosition: FloatingPanelState) -> Bool {
        return true
    }
}
