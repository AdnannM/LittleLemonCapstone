//
//  TabBar.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//

import Foundation

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
