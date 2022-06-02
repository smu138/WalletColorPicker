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
        
        setupFpcSurface()
        customGrabberHandle()
        customizeEdges()
        
        fpc.set(contentViewController: walletViewController)

        fpc.isRemovalInteractionEnabled = true // Optional: Let it removable by a swipe-down
        
        fpc.layout = IntrinsicPanelLayout()
        //fpc.behavior = CustomPanelBehavior()
        
        self.present(fpc, animated: true, completion: nil)

    }
    
    func setupFpcSurface() {
        // Create a new appearance.
        let appearance = SurfaceAppearance()

        // Define shadows
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black
        shadow.offset = CGSize(width: 0, height: -8)
        shadow.radius = 8
        shadow.spread = 3
        appearance.shadows = [shadow]

        // Define corner radius and background color
        appearance.cornerRadius = 8.0
        appearance.backgroundColor = .white

        // Set the new appearance
        fpc.surfaceView.appearance = appearance
    }
    
    //опциональная настройка граббера
    func customGrabberHandle() {
//        let myGrabberHandleView = MyGrabberHandleView()
//        fpc.surfaceView.grabberHandle.isHidden = true
//        fpc.surfaceView.addSubview(myGrabberHandleView)
        
        //fpc.surfaceView.grabberHandlePadding = 10.0
        //fpc.surfaceView.grabberHandleSize = .init(width: 44.0, height: 12.0)
    }
    
    //Customize content padding from surface edges
    func customizeEdges() {
        //Customize content padding from surface edges
        //fpc.surfaceView.contentPadding = .init(top: 20, left: 20, bottom: 20, right: 20)
        
        //Customize margins of the surface edges
        //fpc.surfaceView.containerMargins = .init(top: 20.0, left: 16.0, bottom: 16.0, right: 16.0)
    }
}

extension ViewController: WalletPickerModuleOutput {
    func closeModule() {
        
        fpc.dismiss(animated: true) {
            print("dismissed")
        }

    }
}


