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
    var showFrame = false
    var rounded: CGFloat = 28
    var phase: FlightPhase = .cruise
    var palette: AviationPalette = .beacon
    
    var threshold: Float { phase.viscosity }
    var distanceFactor: Float { phase.fieldStrength }
    var speed: Double { phase.speed }
}
