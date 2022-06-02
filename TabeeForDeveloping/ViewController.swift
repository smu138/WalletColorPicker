//
//  ViewController.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//

import UIKit
import FloatingPanel

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

}


extension ViewController {
    @IBAction func openModal(_ sender: Any) {
        let walletViewController = WalletPickerAssembly(output: self).createModule()
        
        let fpc = FloatingPanelController()
        fpc.set(contentViewController: walletViewController)

        fpc.isRemovalInteractionEnabled = true // Optional: Let it removable by a swipe-down

        self.present(fpc, animated: true, completion: nil)
    }
}

extension ViewController: WalletPickerModuleOutput {
    
}

