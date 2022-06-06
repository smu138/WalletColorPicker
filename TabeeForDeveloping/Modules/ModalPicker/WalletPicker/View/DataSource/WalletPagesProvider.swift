//
//  WalletPagesProvider.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit

struct WalletPagesProvider {
    
    var pages: [WalletSinglePageModel] = []
    
    func makeActive(walletCircleView: WalletCircleCell) {
        let colorsData = WalletSinglePageModel.ColorCircle.ColorsData(
            leftColor: walletCircleView.colorsData.leftColor,
            rightColor: walletCircleView.colorsData.rightColor,
            backgroundColoe: walletCircleView.colorsData.backgroundColoe,
            circleRadius: walletCircleView.colorsData.circleRadius,
            activityInProgress: walletCircleView.colorsData.activityInProgress == true ? false : true,
            needBorder: walletCircleView.colorsData.needBorder == true ? false : true,
            borderColor: walletCircleView.colorsData.borderColor,
            borderWidth: walletCircleView.colorsData.borderWidth,
            cornerRadius: walletCircleView.colorsData.cornerRadius)
        
        walletCircleView.colorsData = colorsData
        walletCircleView.draw(walletCircleView.frame)
    }
    
    //это будет заполняться снаружи - поэтому эти данные будут уходить на сервер - к примеру id этой ячейки
    mutating func makePages() {
        let walletUrl = URL(string: "https://dev1.tabee.mobi/pb/a64c1219-e4d3-11ec-8057-6a13bef2453b")!
        
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
                        borderColor: .blue,
                        borderWidth: 2,
                        cornerRadius: 5),
                      action: { [self] walletCircleView in
                          self.makeActive(walletCircleView: walletCircleView)
                      }),
                
                    .init(id: "id15555",
                          dataForView: .init(
                            leftColor: .orange,
                            rightColor: .green,
                            backgroundColoe: .brown,
                            circleRadius: 15,
                            activityInProgress: false,
                            needBorder: false,
                            borderColor: .blue,
                            borderWidth: 2,
                            cornerRadius: 5),
                          action: { [self] walletCircleView in
                              self.makeActive(walletCircleView: walletCircleView)
                          }),
                
                    .init(id: "id13312",
                          dataForView: .init(
                            leftColor: .orange,
                            rightColor: .green,
                            backgroundColoe: .brown,
                            circleRadius: 15,
                            activityInProgress: false,
                            needBorder: false,
                            borderColor: .blue,
                            borderWidth: 2,
                            cornerRadius: 5),
                          action: { [self] walletCircleView in
                              self.makeActive(walletCircleView: walletCircleView)
                          }),
                
                    .init(id: "id55",
                          dataForView: .init(
                            leftColor: .orange,
                            rightColor: .green,
                            backgroundColoe: .brown,
                            circleRadius: 15,
                            activityInProgress: true,
                            needBorder: true,
                            borderColor: .blue,
                            borderWidth: 2,
                            cornerRadius: 5),
                          action: { [self] walletCircleView in
                              self.makeActive(walletCircleView: walletCircleView)
                          }),
                
                    .init(id: "id1112",
                          dataForView: .init(
                            leftColor: .orange,
                            rightColor: .green,
                            backgroundColoe: .brown,
                            circleRadius: 15,
                            activityInProgress: false,
                            needBorder: true,
                            borderColor: .blue,
                            borderWidth: 2,
                            cornerRadius: 5),
                          action: { [self] walletCircleView in
                              self.makeActive(walletCircleView: walletCircleView)
                          }),
                .init(id: "id13312",
                      dataForView: .init(
                        leftColor: .orange,
                        rightColor: .green,
                        backgroundColoe: .brown,
                        circleRadius: 15,
                        activityInProgress: false,
                        needBorder: false,
                        borderColor: .blue,
                        borderWidth: 2,
                        cornerRadius: 5),
                      action: { [self] walletCircleView in
                          self.makeActive(walletCircleView: walletCircleView)
                      }),
            
                .init(id: "id55",
                      dataForView: .init(
                        leftColor: .orange,
                        rightColor: .green,
                        backgroundColoe: .brown,
                        circleRadius: 15,
                        activityInProgress: true,
                        needBorder: true,
                        borderColor: .blue,
                        borderWidth: 2,
                        cornerRadius: 5),
                      action: { [self] walletCircleView in
                          self.makeActive(walletCircleView: walletCircleView)
                      }),
            
                .init(id: "id1112",
                      dataForView: .init(
                        leftColor: .orange,
                        rightColor: .green,
                        backgroundColoe: .brown,
                        circleRadius: 15,
                        activityInProgress: false,
                        needBorder: true,
                        borderColor: .blue,
                        borderWidth: 2,
                        cornerRadius: 5),
                      action: { [self] walletCircleView in
                          self.makeActive(walletCircleView: walletCircleView)
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
//                          action: { [self] walletCircleView in
//                              self.makeActive(walletCircleView: walletCircleView)
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
//                              action: { [self] walletCircleView in
//                                  self.makeActive(walletCircleView: walletCircleView)
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
//                              action: { [self] walletCircleView in
//                                  self.makeActive(walletCircleView: walletCircleView)
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
//                              action: { [self] walletCircleView in
//                                  self.makeActive(walletCircleView: walletCircleView)
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
//                              action: { [self] walletCircleView in
//                                  self.makeActive(walletCircleView: walletCircleView)
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
//                          action: { [self] walletCircleView in
//                              self.makeActive(walletCircleView: walletCircleView)
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
//                          action: { [self] walletCircleView in
//                              self.makeActive(walletCircleView: walletCircleView)
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
//                          action: { [self] walletCircleView in
//                              self.makeActive(walletCircleView: walletCircleView)
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
//                          action: { [self] walletCircleView in
//                              self.makeActive(walletCircleView: walletCircleView)
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
//                              action: { [self] walletCircleView in
//                                  self.makeActive(walletCircleView: walletCircleView)
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
//                              action: { [self] walletCircleView in
//                                  self.makeActive(walletCircleView: walletCircleView)
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
//                              action: { [self] walletCircleView in
//                                  self.makeActive(walletCircleView: walletCircleView)
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
//                              action: { [self] walletCircleView in
//                                  self.makeActive(walletCircleView: walletCircleView)
//                              })
//                ])
        ]
    }
}
