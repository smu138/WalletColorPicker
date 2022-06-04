//
//  WalletPagesProvider.swift
//  TabeeForDeveloping
//
//  Created by Serg on 04.06.2022.
//

import UIKit

struct WalletPagesProvider {
    
    var pages: [WalletSinglePage] = []
    
    //это будет заполняться снаружи - поэтому эти данные будут уходить на сервер - к примеру id этой ячейки
    mutating func makePages() {
        pages = [
            .init(pageIndex: 0, colorCircles: [
                .init(id: "id1",
                      dataForView: .init(
                        leftColor: .orange,
                        rightColor: .green,
                        backgroundColoe: .brown,
                        circleRadius: 15,
                        activityInProgress: false,
                        needBorder: true,
                        borderColor: .blue,
                        cornerRadius: 5),
                      action: {
                          print("тап на кружочке id1")
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
                            cornerRadius: 5),
                          action: {
                              print("тап на кружочке id15555")
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
                            cornerRadius: 5),
                          action: {
                              print("тап на кружочке id13312")
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
                            cornerRadius: 5),
                          action: {
                              print("тап на кружочке id55")
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
                            cornerRadius: 5),
                          action: {
                              print("тап на кружочке id1112")
                          })
                
            ]),
            
                .init(pageIndex: 1, colorCircles: [
                    .init(id: "id1",
                          dataForView: .init(
                            leftColor: .orange,
                            rightColor: .green,
                            backgroundColoe: .brown,
                            circleRadius: 15,
                            activityInProgress: false,
                            needBorder: true,
                            borderColor: .blue,
                            cornerRadius: 5),
                          action: {
                              print("тап на кружочке id1")
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
                                cornerRadius: 5),
                              action: {
                                  print("тап на кружочке id15555")
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
                                cornerRadius: 5),
                              action: {
                                  print("тап на кружочке id13312")
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
                                cornerRadius: 5),
                              action: {
                                  print("тап на кружочке id55")
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
                                cornerRadius: 5),
                              action: {
                                  print("тап на кружочке id1112")
                              })
                ]),
            
                .init(pageIndex: 2, colorCircles: [
                    .init(id: "id1",
                          dataForView: .init(
                            leftColor: .orange,
                            rightColor: .green,
                            backgroundColoe: .brown,
                            circleRadius: 15,
                            activityInProgress: false,
                            needBorder: true,
                            borderColor: .blue,
                            cornerRadius: 5),
                          action: {
                              print("тап на кружочке id1")
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
                                cornerRadius: 5),
                              action: {
                                  print("тап на кружочке id15555")
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
                                cornerRadius: 5),
                              action: {
                                  print("тап на кружочке id13312")
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
                                cornerRadius: 5),
                              action: {
                                  print("тап на кружочке id55")
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
                                cornerRadius: 5),
                              action: {
                                  print("тап на кружочке id1112")
                              })
                ])
        ]
    }
}
