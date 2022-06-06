//
//  SinglePage.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit

struct WalletSinglePageModel {
    let pageIndex: Int //for page control
    
    struct ColorCircle {
        let id: String
        let dataForView: WalletCircleCell.ColorsData
        
        let action: (_ walletView: WalletCircleCell) -> Void
    }
    
    struct Wallet {
        let walletUrl: URL
        /// Dismiss module after success opened wallet url
        let closeModuleAfterOpenWallet: Bool
    }

    let walletData: Wallet
    
    let colorCircles: [ColorCircle]
}
