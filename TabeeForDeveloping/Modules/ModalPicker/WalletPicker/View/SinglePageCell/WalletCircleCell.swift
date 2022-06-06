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

    var model: WalletSinglePageModel.ColorCircle!
    
    var isActive: Bool = false
    
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
        bgLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: size, height: size), cornerRadius: model.dataForView.cornerRadius).cgPath
        bgLayer.fillColor = model.dataForView.backgroundColoe.cgColor

        if isSelected {
        //if model.dataForView.needBorder {
            layer.borderWidth = model.dataForView.borderWidth
            layer.borderColor = model.dataForView.borderActiveColor.cgColor
            layer.cornerRadius = model.dataForView.cornerRadius
        } else {
            layer.borderWidth = 1
            layer.borderColor = model.dataForView.borderInactiveColor.cgColor
            layer.cornerRadius = model.dataForView.cornerRadius
        }

        layer.addSublayer(bgLayer)
        
        let pathLeft = UIBezierPath(arcCenter: CGPoint(x: halfSize, y: halfSize), radius: model.dataForView.circleRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: false)
        let pathRight = UIBezierPath(arcCenter: CGPoint(x: halfSize, y: halfSize), radius: model.dataForView.circleRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)
        
        
        let shapeLayerRight = CAShapeLayer()
        shapeLayerRight.path = pathRight.cgPath
        shapeLayerRight.fillColor = model.dataForView.leftColor.cgColor
        
        let shapeLayerLeft = CAShapeLayer()
        shapeLayerLeft.path = pathLeft.cgPath
        shapeLayerLeft.fillColor = model.dataForView.rightColor.cgColor

        
        layer.addSublayer(shapeLayerLeft)
        layer.addSublayer(shapeLayerRight)
        
        layer.masksToBounds = true

        //activity здесь по ТЗ не требуется - результат не интерактивен
//        if model.dataForView.activityInProgress {
//            addActivityIndicator()
//        }
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
        model.action(self)
    }
}


// MARK: - Cell configure

extension WalletCircleCell {
    
    override func prepareForReuse() {
        super.prepareForReuse()
        isActive = false
    }
    
    func setupStyle() {
        backgroundColor = .clear
    }

    func configure(with model: WalletSinglePageModel.ColorCircle) {
        self.model = model
    }
    
    override var isSelected: Bool {
        didSet{
           draw(frame)
        }
    }
}

