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
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
            ]),

            .init(pageIndex: 1, colorCircles: [
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
            ]),
        
            .init(pageIndex: 2, colorCircles: [
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
                .init(id: UUID().uuidString, activeBorderColor: .clear, backgroundColor: .white, leftColor: .orange, rightColor: .green, inProgress: false, action: {
                    print("тап на этом кружочке")
                }),
            ])
        ]
    }
}
