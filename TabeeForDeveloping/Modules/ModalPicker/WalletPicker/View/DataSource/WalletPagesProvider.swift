//
//  WalletPagesProvider.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit

final class WalletPagesProvider {
    
    var pages: [WalletSinglePageModel] = []

    func makeActive(walletCircleView: WalletCircleCell) {

        let originalModel = walletCircleView.model!

        print("(Вызов из callback модели данных) тап ячейки \(originalModel.id)")

        //нарисовать border, что она выбрана (и возможно надо обновить другие ячейки - если надо чтобы они соотв обновили border-ы)
        //walletCircleView.draw(walletCircleView.frame)
        //makeAllInactiveExcept(walletCircleView: walletCircleView)
        
    }
    
    
    func makeAllInactiveExcept(walletCircleView: WalletCircleCell) {
        pages = pages.map({ singlePageModel in
            var circles: [WalletSinglePageModel.ColorCircle] = []

            singlePageModel.colorCircles.forEach { colorCircle in
                
                var isActiveBorder = false
                
                let newBorderState = walletCircleView.model.dataForView.needBorder ? false : true
                
                if colorCircle.id == walletCircleView.model.id {
                    isActiveBorder = newBorderState
                } else {
                    isActiveBorder = false
                }
                
                let updatedColorsData = WalletSinglePageModel.ColorCircle.ColorsData(
                    leftColor: walletCircleView.model.dataForView.leftColor,
                    rightColor: walletCircleView.model.dataForView.rightColor,
                    backgroundColoe: walletCircleView.model.dataForView.backgroundColoe,
                    circleRadius: walletCircleView.model.dataForView.circleRadius,
                    activityInProgress: walletCircleView.model.dataForView.activityInProgress,
                    needBorder: isActiveBorder,
                    borderActiveColor: walletCircleView.model.dataForView.borderActiveColor,
                    borderInactiveColor: walletCircleView.model.dataForView.borderInactiveColor,
                    borderWidth: walletCircleView.model.dataForView.borderWidth,
                    cornerRadius: walletCircleView.model.dataForView.cornerRadius)
                
                let circle: WalletSinglePageModel.ColorCircle = WalletSinglePageModel.ColorCircle(
                    id: walletCircleView.model.id,
                    dataForView: updatedColorsData,
                    action: walletCircleView.model.action)
                
                //colorCircle.dataForView.needBorder = false
                circles.append(circle)
                
            }
            
            
            let newModel = WalletSinglePageModel(
                pageIndex: singlePageModel.pageIndex,
                walletData: singlePageModel.walletData,
                colorCircles: circles)
             
            return newModel
        })
    }
    
    //это будет заполняться снаружи - поэтому эти данные будут уходить на сервер - к примеру id этой ячейки
    func makePages() {
        let walletUrl = URL(string: "https://dev1.tabee.mobi/pb/a64c1219-e4d3-11ec-8057-6a13bef2453b")!
        
        let borderInactiveColor: UIColor = .magenta
        pages = [
            .init(
                pageIndex: 0,
                walletData: .init(walletUrl: walletUrl, closeModuleAfterOpenWallet: false),
                colorCircles: [
                .init(id: "id1",
                      dataForView: .init(
                        leftColor: .orange,
                        rightColor: .green,
                        backgroundColoe: .brown,
                        circleRadius: 15,
                        activityInProgress: false,
                        needBorder: true,
                        borderActiveColor: .blue,
                        borderInactiveColor: borderInactiveColor,
                        borderWidth: 2,
                        cornerRadius: 5),
                      action: { [weak self] walletCircleView in
                          self?.makeActive(walletCircleView: walletCircleView)
                      }),
                
                    .init(id: "id15555",
                          dataForView: .init(
                            leftColor: .orange,
                            rightColor: .green,
                            backgroundColoe: .brown,
                            circleRadius: 15,
                            activityInProgress: false,
                            needBorder: false,
                            borderActiveColor: .blue,
                            borderInactiveColor: borderInactiveColor,
                            borderWidth: 2,
                            cornerRadius: 5),
                          action: { [weak self] walletCircleView in
                              self?.makeActive(walletCircleView: walletCircleView)
                          }),
                
                    .init(id: "id13312",
                          dataForView: .init(
                            leftColor: .orange,
                            rightColor: .green,
                            backgroundColoe: .brown,
                            circleRadius: 15,
                            activityInProgress: false,
                            needBorder: false,
                            borderActiveColor: .blue,
                            borderInactiveColor: borderInactiveColor,
                            borderWidth: 2,
                            cornerRadius: 5),
                          action: { [weak self] walletCircleView in
                              self?.makeActive(walletCircleView: walletCircleView)
                          }),
                
                    .init(id: "id55",
                          dataForView: .init(
                            leftColor: .orange,
                            rightColor: .green,
                            backgroundColoe: .brown,
                            circleRadius: 15,
                            activityInProgress: true,
                            needBorder: true,
                            borderActiveColor: .blue,
                            borderInactiveColor: borderInactiveColor,
                            borderWidth: 2,
                            cornerRadius: 5),
                          action: { [weak self] walletCircleView in
                              self?.makeActive(walletCircleView: walletCircleView)
                          }),
                
                    .init(id: "id1112",
                          dataForView: .init(
                            leftColor: .orange,
                            rightColor: .green,
                            backgroundColoe: .brown,
                            circleRadius: 15,
                            activityInProgress: false,
                            needBorder: true,
                            borderActiveColor: .blue,
                            borderInactiveColor: borderInactiveColor,
                            borderWidth: 2,
                            cornerRadius: 5),
                          action: { [weak self] walletCircleView in
                              self?.makeActive(walletCircleView: walletCircleView)
                          }),
                .init(id: "id13312",
                      dataForView: .init(
                        leftColor: .orange,
                        rightColor: .green,
                        backgroundColoe: .brown,
                        circleRadius: 15,
                        activityInProgress: false,
                        needBorder: false,
                        borderActiveColor: .blue,
                        borderInactiveColor: borderInactiveColor,
                        borderWidth: 2,
                        cornerRadius: 5),
                      action: { [weak self] walletCircleView in
                          self?.makeActive(walletCircleView: walletCircleView)
                      }),
            
                .init(id: "id55",
                      dataForView: .init(
                        leftColor: .orange,
                        rightColor: .green,
                        backgroundColoe: .brown,
                        circleRadius: 15,
                        activityInProgress: true,
                        needBorder: true,
                        borderActiveColor: .blue,
                        borderInactiveColor: borderInactiveColor,
                        borderWidth: 2,
                        cornerRadius: 5),
                      action: { [weak self] walletCircleView in
                          self?.makeActive(walletCircleView: walletCircleView)
                      }),
            
                .init(id: "id1112",
                      dataForView: .init(
                        leftColor: .orange,
                        rightColor: .green,
                        backgroundColoe: .brown,
                        circleRadius: 15,
                        activityInProgress: false,
                        needBorder: true,
                        borderActiveColor: .blue,
                        borderInactiveColor: borderInactiveColor,
                        borderWidth: 2,
                        cornerRadius: 5),
                      action: { [weak self] walletCircleView in
                          self?.makeActive(walletCircleView: walletCircleView)
                      })
                
            ]),
            
//                .init(pageIndex: 1, colorCircles: [
//                    .init(id: "id1",
//                          dataForView: .init(
//                            leftColor: .orange,
//                            rightColor: .green,
//                            backgroundColoe: .cyan,
//                            circleRadius: 15,
//                            activityInProgress: false,
//                            needBorder: true,
//                            borderColor: .blue,
//                            borderWidth: 2,
//                            cornerRadius: 5),
//                          action: { [weak self] walletCircleView in
//                              self?.makeActive(walletCircleView: walletCircleView)
//                          }),
//                    
//                        .init(id: "id15555",
//                              dataForView: .init(
//                                leftColor: .orange,
//                                rightColor: .green,
//                                backgroundColoe: .cyan,
//                                circleRadius: 15,
//                                activityInProgress: false,
//                                needBorder: false,
//                                borderColor: .blue,
//                                borderWidth: 2,
//                                cornerRadius: 5),
//                              action: { [weak self] walletCircleView in
//                                  self?.makeActive(walletCircleView: walletCircleView)
//                              }),
//                    
//                        .init(id: "id13312",
//                              dataForView: .init(
//                                leftColor: .orange,
//                                rightColor: .green,
//                                backgroundColoe: .cyan,
//                                circleRadius: 15,
//                                activityInProgress: false,
//                                needBorder: false,
//                                borderColor: .blue,
//                                borderWidth: 2,
//                                cornerRadius: 5),
//                              action: { [weak self] walletCircleView in
//                                  self?.makeActive(walletCircleView: walletCircleView)
//                              }),
//                    
//                        .init(id: "id55",
//                              dataForView: .init(
//                                leftColor: .orange,
//                                rightColor: .green,
//                                backgroundColoe: .cyan,
//                                circleRadius: 15,
//                                activityInProgress: true,
//                                needBorder: true,
//                                borderColor: .blue,
//                                borderWidth: 2,
//                                cornerRadius: 5),
//                              action: { [weak self] walletCircleView in
//                                  self?.makeActive(walletCircleView: walletCircleView)
//                              }),
//                    
//                        .init(id: "id1112",
//                              dataForView: .init(
//                                leftColor: .orange,
//                                rightColor: .green,
//                                backgroundColoe: .cyan,
//                                circleRadius: 15,
//                                activityInProgress: false,
//                                needBorder: true,
//                                borderColor: .blue,
//                                borderWidth: 2,
//                                cornerRadius: 5),
//                              action: { [weak self] walletCircleView in
//                                  self?.makeActive(walletCircleView: walletCircleView)
//                              }),
//                    .init(id: "id13312",
//                          dataForView: .init(
//                            leftColor: .orange,
//                            rightColor: .green,
//                            backgroundColoe: .cyan,
//                            circleRadius: 15,
//                            activityInProgress: false,
//                            needBorder: false,
//                            borderColor: .blue,
//                            borderWidth: 2,
//                            cornerRadius: 5),
//                          action: { [weak self] walletCircleView in
//                              self?.makeActive(walletCircleView: walletCircleView)
//                          }),
//                
//                    .init(id: "id55",
//                          dataForView: .init(
//                            leftColor: .orange,
//                            rightColor: .green,
//                            backgroundColoe: .cyan,
//                            circleRadius: 15,
//                            activityInProgress: true,
//                            needBorder: true,
//                            borderColor: .blue,
//                            borderWidth: 2,
//                            cornerRadius: 5),
//                          action: { [weak self] walletCircleView in
//                              self?.makeActive(walletCircleView: walletCircleView)
//                          }),
//                
//                    .init(id: "id1112",
//                          dataForView: .init(
//                            leftColor: .orange,
//                            rightColor: .green,
//                            backgroundColoe: .cyan,
//                            circleRadius: 15,
//                            activityInProgress: false,
//                            needBorder: true,
//                            borderColor: .blue,
//                            borderWidth: 2,
//                            cornerRadius: 5),
//                          action: { [weak self] walletCircleView in
//                              self?.makeActive(walletCircleView: walletCircleView)
//                          })
//                ]),
            
//                .init(pageIndex: 2, colorCircles: [
//                    .init(id: "id1",
//                          dataForView: .init(
//                            leftColor: .orange,
//                            rightColor: .green,
//                            backgroundColoe: .gray,
//                            circleRadius: 15,
//                            activityInProgress: false,
//                            needBorder: true,
//                            borderColor: .blue,
//                            borderWidth: 2,
//                            cornerRadius: 5),
//                          action: { [weak self] walletCircleView in
//                              self?.makeActive(walletCircleView: walletCircleView)
//                          }),
//
//                        .init(id: "id15555",
//                              dataForView: .init(
//                                leftColor: .orange,
//                                rightColor: .green,
//                                backgroundColoe: .gray,
//                                circleRadius: 15,
//                                activityInProgress: false,
//                                needBorder: false,
//                                borderColor: .blue,
//                                borderWidth: 2,
//                                cornerRadius: 5),
//                              action: { [weak self] walletCircleView in
//                                  self?.makeActive(walletCircleView: walletCircleView)
//                              }),
//
//                        .init(id: "id13312",
//                              dataForView: .init(
//                                leftColor: .orange,
//                                rightColor: .green,
//                                backgroundColoe: .gray,
//                                circleRadius: 15,
//                                activityInProgress: false,
//                                needBorder: false,
//                                borderColor: .blue,
//                                borderWidth: 2,
//                                cornerRadius: 5),
//                              action: { [weak self] walletCircleView in
//                                  self?.makeActive(walletCircleView: walletCircleView)
//                              }),
//
//                        .init(id: "id55",
//                              dataForView: .init(
//                                leftColor: .orange,
//                                rightColor: .green,
//                                backgroundColoe: .gray,
//                                circleRadius: 15,
//                                activityInProgress: true,
//                                needBorder: true,
//                                borderColor: .blue,
//                                borderWidth: 2,
//                                cornerRadius: 5),
//                              action: { [weak self] walletCircleView in
//                                  self?.makeActive(walletCircleView: walletCircleView)
//                              }),
//
//                        .init(id: "id1112",
//                              dataForView: .init(
//                                leftColor: .orange,
//                                rightColor: .green,
//                                backgroundColoe: .gray,
//                                circleRadius: 15,
//                                activityInProgress: false,
//                                needBorder: true,
//                                borderColor: .blue,
//                                borderWidth: 2,
//                                cornerRadius: 5),
//                              action: { [weak self] walletCircleView in
//                                  self?.makeActive(walletCircleView: walletCircleView)
//                              })
//                ])
        ]
    }
}
