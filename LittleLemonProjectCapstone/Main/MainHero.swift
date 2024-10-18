//
//  MainHero.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//

import Foundation
import SwiftUI

struct MainHero: View {
    var body: some View {
        ZStack {
            Color.primary1
            HStack() {
                VStack(alignment: .leading, spacing: 15) {
                    // Restaurant location
                    VStack(alignment: .leading) {
                        Text("Little Lemon")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundStyle(Color.primary2)
                        
                        Text("Chicago, IL")
                            .font(.title3)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                    }
                    
                    VStack(alignment: .leading) {
                        // Short description
                        Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                            .font(.subheadline)
                            .foregroundStyle(Color.secondary3)
                    }
                    
                    Spacer()
                }
                .padding(.top, 10)
                
                VStack {
                    Image("heroImage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.secondary2.opacity(0.1), lineWidth: 2)
                        )
                        .onSubmit {
                            print("Clicked")
                        }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
    }
}
