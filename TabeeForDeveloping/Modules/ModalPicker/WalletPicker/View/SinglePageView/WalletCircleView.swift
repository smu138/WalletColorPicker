//
//  WalletCircleView.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit

class WalletCircleView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    let leftColor: UIColor
    let rightColor: UIColor
    
    init(leftColor: UIColor, rightColor: UIColor) {
        self.leftColor = leftColor
        self.rightColor = rightColor

        super.init(frame: .zero)
        
        backgroundColor = .clear
    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        //isOpaque = true
//        backgroundColor = .clear
//      }
      
      required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
      }

      override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        
        UIColor.red.setFill()
        context.fill(bounds)
      }

}
