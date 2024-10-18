//
//  Main.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 17.10.24.
//

import SwiftUI

struct Main: View {
    @State var text: String = ""
    
    var body: some View {
        VStack(spacing: 0) {
            // Logo and header section
            MainHeader()
            MainHero()
            
            VStack(alignment: .leading) {
                Text("Order for Delivery")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding([.top, .leading], 20)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        ForEach(1...5, id: \.self) { _ in
                            Text("Buttons")
                                .styledText()
                        }
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: 50)
            }
            
            Divider().padding([.leading, .trailing, .top])
            
            // Navigation section with search and list
            NavigationView {
                List {
                    HStack(spacing: 25) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Greek Salad")
                                .fontWeight(.bold)
                            Text("The famous greek salad of crispy lettuce, peppers, olives, our Chicago.")
                                .foregroundStyle(.gray)
                                .fontWeight(.bold)
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                            Text("$ 10")
                                .fontWeight(.bold)
                        }
                        
                        Image("testImage")
                            .resizable()
                            .frame(width: 130, height: 100)
                            .background(.red)
                            .cornerRadius(20)
                    }
                }
                .listStyle(.plain)
                .searchable(text: $text)
            }
        }
    }
}


#Preview {
    Main()
}



