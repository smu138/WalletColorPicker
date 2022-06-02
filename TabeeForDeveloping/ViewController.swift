//
//  ViewController.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//

import UIKit
import FloatingPanel

class ViewController: UIViewController {
    let fpc = FloatingPanelController()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        view.backgroundColor = .orange
    }

}


extension ViewController {
    @IBAction func openModal(_ sender: Any) {
        let walletViewController = WalletPickerAssembly(output: self).createModule()
        
        fpc.set(contentViewController: walletViewController)

        fpc.isRemovalInteractionEnabled = true // Optional: Let it removable by a swipe-down
        
        fpc.layout = IntrinsicPanelLayout()
        //fpc.behavior = CustomPanelBehavior()
        
        self.present(fpc, animated: true, completion: nil)

    }
}

extension ViewController: WalletPickerModuleOutput {
    func closeModule() {
        
        fpc.dismiss(animated: true) {
            print("dismissed")
        }

    }
}

