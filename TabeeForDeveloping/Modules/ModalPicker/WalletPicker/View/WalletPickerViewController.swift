//
//  WalletPickerViewController.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class WalletPickerViewController: UIViewController {
    
    // MARK: - Properties
    
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
        
    }
    
    func setupLayout() {
        
    }
    
    func setupActions() {
        
    }
    
    func applyStyles() {
        
    }
}

// MARK: - Constants

private extension WalletPickerViewController {
    struct Constraints { }
}
