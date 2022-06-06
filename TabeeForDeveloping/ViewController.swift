//
//  ViewController.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let pagesTestProvider = WalletPagesProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}


extension ViewController {
    @IBAction func openModal(_ sender: Any) {
        
        //создание тестового набора данных
        pagesTestProvider.makePages()
        
        //создание модуля с набором тестовых данных
        let walletViewController = WalletPickerAssembly(output: self).createModule(with: pagesTestProvider.pages)
        
        //открытие модального окна
        walletViewController.output.openFPCModal()
    }
}

// MARK: - Исходящие данные из модуля
extension ViewController: WalletPickerModuleOutput {
    
    /// Поддержка событий через делегат модуля (также можно назначать события прямо при создании модели данных для модуля).
    /// (реализацию смотреть в тестовом методе формирования данных `pagesTestProvider.makePages()` )
    /// Оба способа сейчас работают - при интеграции модуля можно выбрать любой из них
    func cellTapped(with circle: WalletSinglePageModel.ColorCircle) {
        print("(опционально) (Вызов из делегата) тап ячейки \(circle.id)")
    }
    
    /// Исходящая из модуля аналитика
    func sendAnalytic(event: WalletPickerDataFlow.Analytic.Events) {
        switch event {

        case .moduleStart:
            print("analitic event: moduleStart")
        case .moduleDismiss:
            print("analitic event: moduleDismiss")
        case .colorCellTap(let cellId):
            print("analitic event colorCellTap with cellId: \(String(describing: cellId))")
        case .openWalletUrl(let url):
            print("analitic event openWalletUrl: \(String(describing: url))")
        case .closeButtonTapped:
            print("analitic event: closeButtonTapped")
        }
    }
}
