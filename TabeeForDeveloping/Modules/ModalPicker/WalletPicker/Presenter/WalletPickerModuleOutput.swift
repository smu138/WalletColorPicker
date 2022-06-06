//
//  WalletPickerModuleOutput.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol WalletPickerModuleOutput: AnyObject {
    func sendAnalytic(event: WalletPickerDataFlow.Analytic.Events)
    func cellTapped(with circle: WalletSinglePageModel.ColorCircle)
}
