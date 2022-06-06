//
//  WalletPagesProvider.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit

struct WalletPagesProvider {

    func makeActive(walletCircleView: WalletCircleCell) {

        let originalModel = walletCircleView.model!

        print("выбрана ячейка с \(originalModel.id)")

        //нарисовать border, что она выбрана (и возможно надо обновить другие ячейки - если надо чтобы они соотв обновили border-ы)
        walletCircleView.draw(walletCircleView.frame)
    }
    
    //это будет заполняться снаружи - поэтому эти данные будут уходить на сервер - к примеру id этой ячейки
    mutating func makePages() -> [WalletSinglePageModel] {
        let walletUrl = URL(string: "https://dev1.tabee.mobi/pb/a64c1219-e4d3-11ec-8057-6a13bef2453b")!
        
        return [
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
