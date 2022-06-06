//
//  WalletPickerPresenter.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import FloatingPanel

final class WalletPickerPresenter {
    
    weak var floatingPanelController: FloatingPanelController?
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
    
    // отправка в output приходящей из view аналитики
    func sendAnalytic(event: WalletPickerDataFlow.Analytic.Events) {
        output?.sendAnalytic(event: event)
    }
    
    //открывает панельку из внешнего контроллера и показывает в ней себя
    func openFPCModal() {
        guard
            let baseViewController = output as? UIViewController,
            let view = view as? WalletPickerViewController
        else {
            assertionFailure("For UIViewControllers ONLY !")
            return
        }
        
        floatingPanelController = router.openModal(baseViewController: baseViewController, walletPickerViewController: view)
    }
    
    func closeTapped() {
        floatingPanelController?.dismiss(animated: true, completion: nil)
    }
    
    func viewIsReady() {
        view.setupInitialState(dataStore.viewState)
        output?.sendAnalytic(event: .moduleStart)
    }
    
    func viewWillAppear() {
        getPages()
    }
}

// MARK: - WalletPickerModuleInput

extension WalletPickerPresenter: WalletPickerModuleInput {
    
}

// MARK: - WalletPickerInteractorOutput

extension WalletPickerPresenter: WalletPickerInteractorOutput {
    
    //это тестовый метод. данные страничек будут приходить снаружи модуля
    func getPagesDidFinish(with state: WalletPickerDataFlow.Presenter.PagesState) {
        dataStore.pagesLoadingState = state
        
        view.updateView(dataStore.viewState)
    }
}

// MARK: - Private

private extension WalletPickerPresenter {
    func getPages() {
        dataStore.pagesLoadingState = .loading
        view.updateView(dataStore.viewState)
        
        interactor.getPages()
    }
}
