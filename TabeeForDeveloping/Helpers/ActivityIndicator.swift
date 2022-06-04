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
    
    func addActivityIndicator() {
        
//
//        let uiView = UIView(frame: self.frame)
//
//        uiView.backgroundColor = .black
//        uiView.alpha = 0.8
//
//        addSubview(uiView)
        
        //let child = ActivityIndicator()
        //self.activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        activityIndicator.center = center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.backgroundColor = (UIColor(white: 0.0, alpha: 0.3))
        activityIndicator.style = .whiteLarge
        //activityIndicator.layer.cornerRadius = 3
        addSubview(activityIndicator)
        
        
        //bringSubviewToFront(activityIndicator)

//        activityIndicator.snp.makeConstraints { make in
//            make.width.height.equalTo(10)
//            make.center.equalToSuperview()
//        }
        
        activityIndicator.startAnimating()
        

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
