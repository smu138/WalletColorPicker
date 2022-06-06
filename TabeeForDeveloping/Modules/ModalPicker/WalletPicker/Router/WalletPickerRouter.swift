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

    func openModal(baseViewController: UIViewController, walletPickerViewController: WalletPickerViewController) -> FloatingPanelController
    {
        let fpc = FloatingPanelController()
        
        fpc.set(contentViewController: walletPickerViewController)

        fpc.isRemovalInteractionEnabled = true // Optional: Let it removable by a swipe-down
        fpc.backdropView.dismissalTapGestureRecognizer.isEnabled = true
        
        let intrinsicLayout = IntrinsicPanelLayout()
        intrinsicLayout.setupFpcSurface(for: fpc)
        intrinsicLayout.customGrabberHandle(for: fpc)
        //intrinsicLayout.customizeEdges(for: fpc)
        
        fpc.layout = intrinsicLayout
        fpc.delegate = walletPickerViewController
        //fpc.behavior = CustomPanelBehavior()
        
        baseViewController.present(fpc, animated: true, completion: nil)
        return fpc
    }
    
    func openUrlTapped(
        fpc: FloatingPanelController,
        with page: WalletSinglePageModel
    ) {
        if UIApplication.shared.canOpenURL(page.walletData.walletUrl) {
            UIApplication.shared.open(page.walletData.walletUrl) { result in
                if result, page.walletData.closeModuleAfterOpenWallet {
                    fpc.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func closePageTapped(with fpc: FloatingPanelController) {
        fpc.dismiss(animated: true, completion: nil)
    }
 
}
