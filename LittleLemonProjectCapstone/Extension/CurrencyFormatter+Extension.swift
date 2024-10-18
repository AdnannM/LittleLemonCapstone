//
//  CurrencyFormatter+Extension.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//

import Foundation


extension NumberFormatter {
    
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
