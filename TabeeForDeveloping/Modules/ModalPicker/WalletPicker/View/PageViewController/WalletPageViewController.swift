//
//  WalletPageViewController.swift
//  TabeeForDeveloping
//
//  Created by Serg on 02.06.2022.
//

import Foundation
import UIKit
import SnapKit

enum Pages: CaseIterable {
    case pageZero
    case pageOne
    case pageTwo
    case pageThree
    
    var color: UIColor {
        switch self {
        case .pageZero:
            return .red
        case .pageOne:
            return .green
        case .pageTwo:
            return .blue
        case .pageThree:
            return .magenta
        }
    }
    
    var index: Int {
        switch self {
        case .pageZero:
            return 0
        case .pageOne:
            return 1
        case .pageTwo:
            return 2
        case .pageThree:
            return 3
        }
    }
}

class WalletPageViewController: UIViewController {

    let coloredView: UIView = {
        $0.backgroundColor = .green
        $0.layer.cornerRadius = 25
        return $0
    }(UIView())
    
    var page: Pages
    
    init(with page: Pages) {
        self.page = page
        
        coloredView.backgroundColor = page.color

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(coloredView)
        coloredView.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.center.equalToSuperview()
            //make.top.bottom.equalToSuperview()
        }
        
        
        
        //self.view.addSubview(titleLabel!)
    }
}
