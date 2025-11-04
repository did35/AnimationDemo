//
//  AnimationDemoViewModel.swift
//  AnimationDemo
//
//  Created by Didier Delhaisse on 04/11/2025.
//

import Foundation

@MainActor
@Observable
class AnimationDemoViewModel {
    var phase: FlightPhase = .cruise
    var paletter: AviationPalette = .beacon
    
    // Expose shader inputs derived from the chosen "flight phase".
    var threshold: Float { phase.viscosity }
    var distanceFactor: Float { phase.fieldLength }
    var speed: Double { phase.speed }
    
    // UI toggles
    var rounded: CGFloat = 28
    var showFrame = false
}
