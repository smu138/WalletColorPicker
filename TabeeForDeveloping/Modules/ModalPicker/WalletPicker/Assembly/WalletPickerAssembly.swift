//
//  WalletPickerAssembly.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class WalletPickerAssembly {
    
    private weak var output: WalletPickerModuleOutput?
    private weak var input: WalletPickerModuleInput?
    
    //private var transition: Transition?
    
    init(
        output: WalletPickerModuleOutput? = nil,
        input: WalletPickerModuleInput? = nil
       // transition: Transition? = nil
    ) {
        self.output = output
        self.input = input
       // self.transition = transition
    }
    
    func createModule(with pages: [WalletSinglePageModel]) -> WalletPickerViewController {
        let viewController = WalletPickerViewController()
        configure(viewController: viewController, with: pages)
        return viewController
    }
}

private extension WalletPickerAssembly {
    func configure(
        viewController: WalletPickerViewController,
        with pages: [WalletSinglePageModel]
    ) {
        let router = WalletPickerRouter()
       // router.viewController = viewController
       // router.transition = transition
        
        let interactor = WalletPickerInteractor()
        let dataStore = WalletPickerDataStore()
        
        //данные приходят сразу - загрузка не требуется
        dataStore.pagesLoadingState = .loaded(pages: pages)
        
        let presenter = WalletPickerPresenter(
            interactor: interactor,
            router: router,
            dataStore: dataStore
        )
        
        presenter.view = viewController
        presenter.output = output
        presenter.moduleInput = input
        interactor.output = presenter
        viewController.output = presenter
    }
}
