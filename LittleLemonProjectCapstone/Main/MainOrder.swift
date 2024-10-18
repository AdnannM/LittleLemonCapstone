//
//  MenuOrder.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//

import SwiftUI

struct MainOrder: View {
    
    var dish: Dish
    
    var body: some View {
        LittleLemonLogo()
            .padding(.top, 40)
        Text(dish.category ?? "")
            .styledText()
        Spacer()
    }
}

#Preview {
    MainOrder(dish: Dish())
}
