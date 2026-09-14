//
//  Period.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 12.09.26.
//

import Foundation
import SwiftUI


public enum Period {
    case halftime
    case final
    
    func name() -> String {
        switch self {
            case .halftime : return "Halftime Score"
            case .final    : return "Final Score"
        }
    }
    
    func font() -> Font {
        switch self {
            case .halftime : return Constants.halfTimeScoreFont
            case .final    : return Constants.finalScoreFont
        }
    }
    
    func uiFont() -> UIFont {
        switch self {
            case .halftime : return Constants.halfTimeScoreUIFont
            case .final    : return Constants.finalScoreUIFont
        }
    }
}
