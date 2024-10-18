//
//  TestView.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        ZStack {
            MeshGradient(
                width: 3,
                height: 3,
                points: [
                    [0.0, 0.0], [0.5, 0.0], [1.0, 0.0],
                    [0.0, 0.5], [1.0, 0.5], [1.0, 0.5],
                    [0.0, 1.0], [0.0, 0.5], [1.0, 1.0]
                ],
                colors: [
                    .primary1, .primary1, .primary1,
                    .gray, .primary2, .primary1,
                    .gray, .primary1, .gray
                ]
            )
        }.ignoresSafeArea()
    }
}

#Preview {
    TestView()
}
