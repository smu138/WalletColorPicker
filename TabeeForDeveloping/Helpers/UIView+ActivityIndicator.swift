//
//  ActivityIndicator.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit
import SnapKit

extension UIView {
    
    var activityHudTag: Int {
        1001
    }
    
    var hudView: UIView? {
        viewWithTag(activityHudTag)
    }
    
    func addActivityIndicator() {
        var hudView = self.viewWithTag(activityHudTag)

        if hudView != nil {
            hudView!.removeFromSuperview()
        }

        hudView = UIView(frame: self.bounds)
        hudView!.alpha = 0
        hudView!.tag = activityHudTag
        hudView?.isHidden = false
        hudView?.backgroundColor = .clear

        addSubview(hudView!)
        hudView!.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let indicator = UIActivityIndicatorView()
        indicator.backgroundColor = (UIColor(white: 0.0, alpha: 0.5))
        
        hudView!.addSubview(indicator)
        
        indicator.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()
        }
        
        indicator.startAnimating()

        hudView?.setNeedsLayout()
        hudView?.layoutIfNeeded()

        UIView.animate(withDuration: 0.15, animations: {
            hudView?.alpha = 1.0
        })
    }
    
    func removeAtivityIndicator() {
        if let hudView = hudView {
            if hudView.isHidden == false {
                UIView.animate(withDuration: 0.15, animations: {
                    hudView.alpha = 0
                }, completion: { _ in
                    hudView.removeFromSuperview()
                })
            } else {
                hudView.removeFromSuperview()
            }
        }
    }
    
}
