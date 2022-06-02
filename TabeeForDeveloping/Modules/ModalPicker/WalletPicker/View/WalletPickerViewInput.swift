//
//  WalletPickerViewInput.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol WalletPickerViewInput: AnyObject {
    typealias DataFlow = WalletPickerDataFlow.View
    
    func setupInitialState(_ viewState: DataFlow.ViewState)
}
