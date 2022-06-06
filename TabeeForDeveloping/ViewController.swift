//
//  ViewController.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//

import UIKit
import FloatingPanel

class ViewController: UIViewController {
    //let fpc = FloatingPanelController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = .white
    }

}


extension ViewController {
    @IBAction func openModal(_ sender: Any) {
        let walletViewController = WalletPickerAssembly(output: self).createModule()
        walletViewController.output.openFPCModal()
    }
}

extension ViewController: WalletPickerModuleOutput {
    
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
        }
        
    }
    
    
    
    func closeModule() {
        
//        fpc.dismiss(animated: true) {
//            print("dismissed")
//        }

    }
}


extension ViewController: FloatingPanelControllerDelegate {
    
}
