//
//  WalletPickerDataFlow.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

struct WalletPickerDataFlow {
    struct View {
        enum ViewState {
            case loading
            case loaded(pages: [WalletSinglePageModel])
            case error
        }
    }

    struct Presenter {
        enum PagesState {
            case loading
            case loaded(pages: [WalletSinglePageModel])
            case error
        }
    }

    struct Interactor { }
    
    struct Analytic {
        enum Events {
            case moduleStart
            case moduleDismiss
            case colorCellTap(_ cellId: String?)
            case openWalletUrl(_ url: URL?)
        }
    }
}
