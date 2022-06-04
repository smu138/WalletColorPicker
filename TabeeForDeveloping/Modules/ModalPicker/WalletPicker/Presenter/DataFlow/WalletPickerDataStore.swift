//
//  WalletPickerDataStore.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class WalletPickerDataStore {
    
    // MARK: View States
    var viewState: WalletPickerDataFlow.View.ViewState {
        switch pagesLoadingState {
            
        case .loading:
            return .loading
        case .loaded(pages: let pages):
            return .loaded(pages: pages)
        case .error:
            return .error
        }
    }

    // MARK: Presenter States
    var pagesLoadingState: WalletPickerDataFlow.Presenter.PagesState = .loading

    // MARK: Interactor States

}
