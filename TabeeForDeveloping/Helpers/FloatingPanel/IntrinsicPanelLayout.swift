//
//  IntrinsicPanelLayout.swift
//  TabeeForDeveloping
//
//  Created by Serg on 06.06.2022.
//

import FloatingPanel

final class IntrinsicPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .full
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelIntrinsicLayoutAnchor(absoluteOffset: 0, referenceGuide: .safeArea)
            //.half: FloatingPanelIntrinsicLayoutAnchor(fractionalOffset: 0.5, referenceGuide: .safeArea)
        ]
    }
    
    func backdropAlpha(for state: FloatingPanelState) -> CGFloat {
        switch state {
        case .full: return 0.05 //hack for working tapToDismiss o backdrop
        default: return 0.0
        }
    }
}

// MARK: - Custom UI configurations

extension IntrinsicPanelLayout {
    func setupFpcSurface(for fpc: FloatingPanelController) {
        let appearance = SurfaceAppearance()

        // Define shadows
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.black
        shadow.offset = CGSize(width: 0, height: -1)
        shadow.radius = 2
        shadow.spread = 1
        shadow.opacity = 0.3
        appearance.shadows = [shadow]

        // Define corner radius and background color
        appearance.cornerRadius = 8.0
        appearance.backgroundColor = .white
        
        fpc.surfaceView.appearance = appearance
    }
    
    //опциональная настройка граббера
    func customGrabberHandle(for fpc: FloatingPanelController) {
//       let myGrabberHandleView = GrabberViewCustom()
//        fpc.surfaceView.grabberHandle.isHidden = true
//        fpc.surfaceView.addSubview(myGrabberHandleView)
        
        //fpc.surfaceView.grabberHandle.barColor = .darkGray
        //fpc.surfaceView.grabberHandlePadding = 10.0
        fpc.surfaceView.grabberHandleSize = .init(width: 120.0, height: 5.0)
    }
    
    //Customize content padding from surface edges
    func customizeEdges(for fpc: FloatingPanelController) {
        //Customize content padding from surface edges
        //fpc.surfaceView.contentPadding = .init(top: 20, left: 20, bottom: 20, right: 20)
        
        //Customize margins of the surface edges
        //fpc.surfaceView.containerMargins = .init(top: 20.0, left: 16.0, bottom: 16.0, right: 16.0)
    }
}
