//
//  SinglePage.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit

struct WalletSinglePage {
    let pageIndex: Int //for page control
    
    struct ColorCircle {
        let id: String
        let dataForView: WalletCircleView.ColorsData
        
        let action: () -> Void
    }
    
    let colorCircles: [ColorCircle]
}
