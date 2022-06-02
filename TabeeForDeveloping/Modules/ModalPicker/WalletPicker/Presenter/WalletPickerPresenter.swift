//
//  WalletPickerPresenter.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class WalletPickerPresenter {
    
    weak var view: WalletPickerViewInput!
    weak var output: WalletPickerModuleOutput?
    private let interactor: WalletPickerInteractorInput
    private let router: WalletPickerRouter
    private let dataStore: WalletPickerDataStore
    
    init(
        interactor: WalletPickerInteractor,
        router: WalletPickerRouter,
        dataStore: WalletPickerDataStore
    ) {
        self.interactor = interactor
        self.router = router
        self.dataStore = dataStore
    }
}

// MARK: - WalletPickerViewOutput

extension WalletPickerPresenter: WalletPickerViewOutput {
    
    func viewIsReady() {
        view.setupInitialState(dataStore.viewState)
    }
    
    func viewWillAppear() { }
}

// MARK: - WalletPickerModuleInput

extension WalletPickerPresenter: WalletPickerModuleInput {
    
}

// MARK: - WalletPickerInteractorOutput

extension WalletPickerPresenter: WalletPickerInteractorOutput {
    
}

// MARK: - Private

private extension WalletPickerPresenter {
    
}
