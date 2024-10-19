//
//  MainDetails.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//

import SwiftUI

struct MainDetails: View {
    
    var dish: Dish
    
    var body: some View {
        VStack {
            Text(dish.title ?? "")
                .styledText()
            
            Text(dish.itemDescription ?? "")
                .styledText()
            
            Text(dish.price ?? "")
                .styledText()
        }
    }
}

#Preview {
    MainDetails(dish: Dish())
}
