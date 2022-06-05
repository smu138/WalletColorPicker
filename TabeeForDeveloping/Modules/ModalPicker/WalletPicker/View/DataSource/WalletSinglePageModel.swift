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
    
    let colorCircles: [ColorCircle]
}
