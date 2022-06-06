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
        
        struct ColorsData {
            let leftColor: UIColor
            let rightColor: UIColor
            
            let backgroundColoe: UIColor

            let circleRadius: CGFloat //радиус внутреннего круга
            
            let activityInProgress: Bool //показывать ли на нем индикатор загрузки
            let needBorder: Bool //бордер вокруг
            let borderColor: UIColor
            let borderWidth: CGFloat
            
            let cornerRadius: CGFloat
        }
        
        let id: String
        let dataForView: ColorsData
        
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
