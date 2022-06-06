//
//  WalletCircleView.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit

class WalletCircleCell: UICollectionViewCell {
    
    static let reuseId: String = String(describing: WalletCircleCell.self)
    
    var tapRecognizer: UITapGestureRecognizer?
    
    var action: ((_ walletCircle: WalletCircleCell) -> Void)?

    var colorsData: WalletSinglePageModel.ColorCircle.ColorsData!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
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

        
        layer.borderWidth = colorsData.borderWidth
        layer.borderColor = colorsData.borderColor.cgColor
        layer.cornerRadius = colorsData.cornerRadius
        
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

        
        layer.addSublayer(shapeLayerLeft)
        layer.addSublayer(shapeLayerRight)
        
        layer.masksToBounds = true

        if colorsData.activityInProgress {
            addActivityIndicator()
        }
    }
}

// MARK: - Actions

extension WalletCircleCell {
    func setupAction() {

        if let tapRecognizer = tapRecognizer {
            removeGestureRecognizer(tapRecognizer)
        }

        tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        tapRecognizer!.cancelsTouchesInView = false
        
        addGestureRecognizer(tapRecognizer!)
    }
    
    @objc func tapHandler(_ recognizer: UIGestureRecognizer) {
        action?(self)
    }
}


// MARK: - Cell configure

extension WalletCircleCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupStyle() {
        backgroundColor = .clear
    }
    
    func configure(colorsData: WalletSinglePageModel.ColorCircle.ColorsData, action: @escaping (_ walletCircle: WalletCircleCell) -> Void) {
        self.colorsData = colorsData

        self.action = action
    }
}

