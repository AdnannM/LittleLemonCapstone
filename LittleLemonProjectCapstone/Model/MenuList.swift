//
//  MenuList.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//

import Foundation

struct MenuList: Decodable {
    var menu : [MenuItem]
}

struct MenuItem: Decodable {
    let title: String
    let itemDescription: String
    let price: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case itemDescription = "description"
        case price
        case image
        case category
    }
}
