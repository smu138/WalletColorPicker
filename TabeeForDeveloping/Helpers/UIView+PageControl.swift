//
//  UIView+PageControl.swift
//  TabeeForDeveloping
//
//  Created by Serg on 06.06.2022.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    //hack for hide default pageControl if pages count > 1  - currently bugged with floating panel constraints
    func togglePageControl(pageCount: Int, threshold: Int = 1) {
        
        var hidden = true
        
        if pageCount > threshold {
            hidden = false
        }
        
        for subView in subviews {
            if subView is UIPageControl {
                
//                if hidden {
//                    subView.snp.remakeConstraints { make in
//                        make.width.equalTo(0)
//                        make.height.equalTo(0)
//                    }
//                } else {
//                    subView.snp.remakeConstraints { make in
//                        make.height.equalTo(20)
//                    }
//                }
                subView.isHidden = hidden

            }
        }
    }
}
