//
//  ActivityIndicator.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit
import SnapKit

final class ActivityIndicator: UIViewController {
    var spinner = UIActivityIndicatorView(style: .whiteLarge)
    
    static let viewHUDTag = 1001

    override func loadView() {
        view = UIView()
        view.backgroundColor = .purple//UIColor(white: 0, alpha: 0.7)

        //spinner.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(spinner)
        
        spinner.snp.makeConstraints { make in
            //make.center.equalTo(view.center)
            make.edges.equalToSuperview()
        }
        
        spinner.startAnimating()
//
//        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension UIView {
    
    var hudView: UIView? {
        viewWithTag(ActivityIndicator.viewHUDTag)
    }
    
    func addActivityIndicator1() {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.backgroundColor = (UIColor(white: 0.0, alpha: 0.3))
        activityIndicator.style = .whiteLarge
        //activityIndicator.layer.cornerRadius = 3
        addSubview(activityIndicator)

        activityIndicator.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview().offset(1.5)
            //make.center.equalToSuperview()
        }
        
        activityIndicator.startAnimating()
    }
    
    func addActivityIndicator() {
        var hudView = self.viewWithTag(ActivityIndicator.viewHUDTag)

        if hudView != nil {
            hudView!.removeFromSuperview()
        }

        hudView = UIView(frame: self.bounds)
        hudView!.alpha = 0
        hudView!.tag = ActivityIndicator.viewHUDTag

//        if inRect {
//            hudView?.layer.cornerRadius = 10
//        }

        self.addSubview(hudView!)
        hudView!.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        let indicator = UIActivityIndicatorView()
        indicator.backgroundColor = (UIColor(white: 0.0, alpha: 0.5))
        
        hudView!.addSubview(indicator)
        
        indicator.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
            make.center.equalToSuperview()//.offset(1.5)
            //make.center.equalToSuperview()
        }
        
        indicator.startAnimating()

        hudView?.isHidden = false
        //hudView?.backgroundColor = .clear

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
