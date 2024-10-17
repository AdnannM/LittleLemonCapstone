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
            VStack {
                LittleLemonLogo()
                Text("Little Lemon")
                Text("Chicago IL")
                Text("Best restaurant in town")
            }
            .padding()
            
            // Navigation section with search and list
            NavigationView {
                List {
                    Text("Food Item 1")
                    Text("Food Item 2")
                    Text("Food Item 3")
                    Text("Food Item 4")
                    Text("Food Item 5")
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
