//
//  WalletPickerAssembly.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class WalletPickerAssembly {
    
    private weak var output: WalletPickerModuleOutput?
    //private var transition: Transition?
    
    init(
        output: WalletPickerModuleOutput? = nil
       // transition: Transition? = nil
    ) {
        self.output = output
       // self.transition = transition
    }
    
    func createModule() -> WalletPickerViewController {
        let viewController = WalletPickerViewController()
        configure(viewController)
        return viewController
    }
}

private extension WalletPickerAssembly {
    func configure(_ viewController: WalletPickerViewController) {
        let router = WalletPickerRouter()
       // router.viewController = viewController
       // router.transition = transition
        
        let interactor = WalletPickerInteractor()
        let dataStore = WalletPickerDataStore()
        
        let presenter = WalletPickerPresenter(
            interactor: interactor,
            router: router,
            dataStore: dataStore
        )
        
        presenter.view = viewController
        presenter.output = output
        interactor.output = presenter
        viewController.output = presenter
    }
}
