//
//  Storage.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 14.09.26.
//  Copyright © 2026 Gerrit Grunwald. All rights reserved.
//

import Foundation
import SwiftUI


extension Key {
    static let homeTeamLogo     : Key = "homeTeamLogo"
    static let opponentTeamLogo : Key = "opponentTeamLogo"
}



// Define storage
public struct Properties {
    
    static var instance = Properties()
    
    @UserDefault(key: .homeTeamLogo, defaultValue: "")
    var homeTeamLogo: String?
    
    @UserDefault(key: .opponentTeamLogo, defaultValue: "")
    var opponentTeamLogo: String?
    
    
    private init() {}
}
