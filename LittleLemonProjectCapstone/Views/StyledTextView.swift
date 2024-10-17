//
//  StyledTextView.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 17.10.24.
//

import SwiftUI

// Create a custom modifier
struct StyledTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding([.leading, .trailing], 40)
            .padding([.top, .bottom], 8)
            .foregroundStyle(Color.primary1)
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
