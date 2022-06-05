//
//  WalletCircleView.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit

class WalletCircleView: UIView {

    let activityIndicator = UIActivityIndicatorView()
    
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
    
    let action: (_ walletCircle: WalletCircleView) -> Void

    var colorsData: ColorsData //var чтобы можно было менять извне
    
    init(colorsData: ColorsData, action: @escaping (_ walletCircle: WalletCircleView) -> Void) {
        self.colorsData = colorsData

        self.action = action
        
        super.init(frame: .zero)
        
        backgroundColor = .clear
        
        setupAction()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = rect.height
        let halfSize = size / 2
        
        let bgLayer = CAShapeLayer()
        bgLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size, height: size), cornerRadius: colorsData.cornerRadius).cgPath
        bgLayer.fillColor = colorsData.backgroundColoe.cgColor

        if colorsData.needBorder {
            layer.borderWidth = colorsData.borderWidth
            layer.borderColor = colorsData.borderColor.cgColor
            layer.cornerRadius = colorsData.cornerRadius
        }

        layer.addSublayer(bgLayer)
        
        let pathLeft = UIBezierPath(arcCenter: CGPoint(x: halfSize, y: halfSize), radius: colorsData.circleRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: false)
        let pathRight = UIBezierPath(arcCenter: CGPoint(x: halfSize, y: halfSize), radius: colorsData.circleRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)
        
        
        let shapeLayerRight = CAShapeLayer()
        shapeLayerRight.path = pathRight.cgPath
        shapeLayerRight.fillColor = colorsData.leftColor.cgColor
        
        let shapeLayerLeft = CAShapeLayer()
        shapeLayerLeft.path = pathLeft.cgPath
        shapeLayerLeft.fillColor = colorsData.rightColor.cgColor

        
        self.layer.addSublayer(shapeLayerLeft)
        self.layer.addSublayer(shapeLayerRight)
        
        self.layer.masksToBounds = true

        if colorsData.activityInProgress {
            addActivityIndicator()
        }
    }


    func setupAction() {
        addGestureRecognizer(
            UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        )
    }
    
    @objc func tapHandler(_ recognizer: UIGestureRecognizer) {
        action(self)
    }
}


