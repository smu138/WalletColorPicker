//
//  WalletPickerViewOutput.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol WalletPickerViewOutput {
    func viewIsReady()
    func viewWillAppear()
    
    func closePageTapped(with page: WalletSinglePageModel)
    func openUrlTapped(with page: WalletSinglePageModel)
    func cellTapped(with circle: WalletSinglePageModel.ColorCircle)
    
    //открывает из внешнего контроллера - этот
    func openFPCModal()
    
    func sendAnalytic(event: WalletPickerDataFlow.Analytic.Events)
}
