//
//  FlightPhase.swift
//  AnimationDemo
//
//  Created by Didier Delhaisse on 04/11/2025.
//

import Foundation

enum FlightPhase: String, CaseIterable, Identifiable {
    case taxi, climb, cruise, descent, approach
    var id: String { rawValue }
    
    /// Aviation-style tuning: higher "speed" feels more turbulent, higher "viscosity" = ticker lava.
    var speed: Double {
        switch self {
        case .taxi: return 0.35
        case .climb: return 0.55
        case .cruise: return 0.28
        case .descent: return 0.45
        case .approach: return 0.32
        }
    }
    
    var viscosity: Float {
        switch self {
        case .taxi: return 1.1
        case .climb: return 0.95
        case .cruise: return 1.25
        case .descent: return 1.05
        case .approach: return 1.2
        }
    }
    
    var fieldLength: Float {
        switch self {
        case .taxi: return 1.1
        case .climb: return 0.95
        case .cruise: return 1.25
        case .descent: return 1.05
        case .approach: return 1.2
        }
    }
}
