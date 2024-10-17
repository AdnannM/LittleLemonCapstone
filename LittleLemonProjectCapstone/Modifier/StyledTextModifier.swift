//
//  StyledTextModifier.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 17.10.24.
//

import SwiftUI

extension View {
    func styledText() -> some View {
        modifier(StyledTextModifier())
    }
}
