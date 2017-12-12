//
//  PriceFormatterHelper.swift
//  Test
//
//  Created by Alaa on 12/11/17.
//  Copyright © 2017 Alaa Qashou. All rights reserved.
//

import Foundation


extension Formatter {
    static let number = NumberFormatter()
}


extension Double {
    
    func formatPrice() -> String
    {
        return self.fractionDigits(min: 3, max: 3, roundingMode: .floor)
    }
    
    func fractionDigits(min: Int = 2, max: Int = 2, roundingMode: NumberFormatter.RoundingMode = .up) -> String {
        Formatter.number.minimumFractionDigits = min
        Formatter.number.maximumFractionDigits = max
        Formatter.number.roundingMode = roundingMode
        Formatter.number.numberStyle = .decimal
        return Formatter.number.string(for: self) ?? ""
    }
    
  
    
    
    
}


extension Decimal {
    
    func formatPrice() -> String
    {
        return self.fractionDigits(min: 3, max: 3, roundingMode: .floor)
    }
    
    func fractionDigits(min: Int = 2, max: Int = 2, roundingMode: NumberFormatter.RoundingMode = .up) -> String {
        Formatter.number.minimumFractionDigits = min
        Formatter.number.maximumFractionDigits = max
        Formatter.number.roundingMode = roundingMode
        Formatter.number.numberStyle = .decimal
        return Formatter.number.string(for: self) ?? ""
    }
}
