//
//  WalletPickerRouter.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import FloatingPanel

final class WalletPickerRouter /*: Router<WalletPickerViewController>, WalletPickerRouter.ConnectedRoutes */ {
   // typealias ConnectedRoutes = NavigatorRoute

    
    func openModal(baseViewController: UIViewController, walletPickerViewController: WalletPickerViewController) {
        //let walletViewController = WalletPickerAssembly(output: baseViewController).createModule()
        
        let fpc = FloatingPanelController()

        setupFpcSurface(for: fpc)
        customGrabberHandle(for: fpc)
//        customizeEdges()
        
        fpc.set(contentViewController: walletPickerViewController)

        fpc.isRemovalInteractionEnabled = true // Optional: Let it removable by a swipe-down
        fpc.backdropView.dismissalTapGestureRecognizer.isEnabled = true
        
        fpc.layout = IntrinsicPanelLayout()
        fpc.delegate = walletPickerViewController
        //fpc.behavior = CustomPanelBehavior()
        
        baseViewController.present(fpc, animated: true, completion: nil)

    }
    
    func setupFpcSurface(for fpc: FloatingPanelController) {
        let appearance = SurfaceAppearance()

        // Define shadows
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black
        shadow.offset = CGSize(width: 0, height: -1)
        shadow.radius = 2
        shadow.spread = 1
        shadow.opacity = 0.3
        appearance.shadows = [shadow]

        // Define corner radius and background color
        appearance.cornerRadius = 8.0
        appearance.backgroundColor = .white
        
        fpc.surfaceView.appearance = appearance
    }
    
    //опциональная настройка граббера
    func customGrabberHandle(for fpc: FloatingPanelController) {
//       let myGrabberHandleView = GrabberViewCustom()
//        fpc.surfaceView.grabberHandle.isHidden = true
//        fpc.surfaceView.addSubview(myGrabberHandleView)
        
        //fpc.surfaceView.grabberHandle.barColor = .darkGray
        //fpc.surfaceView.grabberHandlePadding = 10.0
        fpc.surfaceView.grabberHandleSize = .init(width: 120.0, height: 5.0)
    }
}
