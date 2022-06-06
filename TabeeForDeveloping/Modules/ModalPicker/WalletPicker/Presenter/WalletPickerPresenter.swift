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
    weak var moduleInput: WalletPickerModuleInput?
    
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
    func cellTapped(with circle: WalletSinglePageModel.ColorCircle) {
        output?.sendAnalytic(event: .colorCellTap(circle.id))
        output?.cellTapped(with: circle)
    }
    
    
    func closePageTapped(with page: WalletSinglePageModel) {
        output?.sendAnalytic(event: .closeButtonTapped)
        router.closePageTapped(with: floatingPanelController!)
    }
    
    func openUrlTapped(with page: WalletSinglePageModel) {
        output?.sendAnalytic(event: .openWalletUrl(page.walletData.walletUrl))
        router.openUrlTapped(fpc: floatingPanelController!, with: page)
    }
    
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
        //все данные подгружены в Assembly - поэтому здесь просто обновить view с тем что есть
        view.updateView(dataStore.viewState)
    }
}

// MARK: - WalletPickerModuleInput

extension WalletPickerPresenter: WalletPickerModuleInput { }

// MARK: - WalletPickerInteractorOutput

extension WalletPickerPresenter: WalletPickerInteractorOutput { }
