//
//  Home.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 17.10.24.
//

import SwiftUI

enum TabBar: String, CaseIterable {
    case main
    case profile
    
    var title: String {
        rawValue.capitalized
    }
    
    var systemImage: String {
        switch self {
        case .main:
            return "list.dash"
        case .profile:
            return "square.and.pencil"
        }
    }
}

struct Home: View {
    
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
