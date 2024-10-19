//
//  DishRowView.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 19.10.24.
//

import SwiftUI

struct DishRowView: View {
    let dish: Dish
    
    var body: some View {
        HStack(spacing: 25) {
            VStack(alignment: .leading, spacing: 10) {
                Text(dish.title ?? "")
                    .fontWeight(.bold)
                
                Text(dish.itemDescription ?? "")
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
                    .font(.caption)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                
                if let price = Double(dish.price ?? "") {
                    let formattedPrice = NumberFormatter.currency.string(from: price as NSNumber) ?? ""
                    Text(formattedPrice)
                        .fontWeight(.bold)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            AsyncImage(url: URL(string: dish.image ?? "")) { image in
                image
                    .resizable()
                    .frame(width: 130, height: 100)
                    .cornerRadius(20)
            } placeholder: {
                ProgressView()
            }
        }
        .padding(.vertical, 10)
    }
}

