//
//  AviationPalette.swift
//  AnimationDemo
//
//  Created by Didier Delhaisse on 04/11/2025.
//

import SwiftUI

struct AviationPalette {
    var bottom: Color
    var top: Color
    
    static let beacon = AviationPalette(
        bottom: Color(red: 0.98, green: 0.20, blue: 0.15),
        top: Color(red: 1.00, green: 0.75, blue: 0.20)
    )
    
    static let nightOps = AviationPalette(
        bottom: Color(red: 0.90, green: 0.10, blue: 0.25),
        top: Color(red: 1.00, green: 0.45, blue: 0.10)
    )
}
