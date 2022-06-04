//
//  WalletPickerInteractor.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

final class WalletPickerInteractor: WalletPickerInteractorInput {
    weak var output: WalletPickerInteractorOutput!
    
    //это тестовый метод - вообзе заполнение дагнными будет происходить ВНЕ модуля ! Удалить его после тестирования
    func getPages() {
        var pagesProvider = WalletPagesProvider()
        
        pagesProvider.makePages()
        
        output.getPagesDidFinish(with: .loaded(pages: pagesProvider.pages))
    }

}
