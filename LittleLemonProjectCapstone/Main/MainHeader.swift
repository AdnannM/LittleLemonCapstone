//
//  MainHeader.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//

import Foundation
import SwiftUI

struct MainHeader: View {
    var body: some View {
        VStack {
            HStack(spacing: 40) {
                Spacer()
                Image("logo")
                Image(systemName: "calendar.badge.plus")
                    .font(.title)
                    .padding(.trailing, 20)
                    .foregroundStyle(Color.primary1)
            }
        }
        .padding()
    }
}
