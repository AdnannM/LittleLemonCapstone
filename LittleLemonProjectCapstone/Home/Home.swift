//
//  Home.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 17.10.24.
//

import SwiftUI

struct Home: View {
    
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        TabView {
            ForEach(TabBar.allCases, id: \.self) { tab in
                tabView(for: tab)
                    .tabItem {
                        Label(
                            tab.title,
                            systemImage: tab.systemImage
                        )
                    }
                    .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    private func tabView(for tab: TabBar) -> some View {
        switch tab {
        case .main:
            Main()
        case .profile:
            UserProfile()
        }
    }
}

#Preview {
    Home()
}
