//
//  Constants.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 11.09.26.
//

import Foundation
import SwiftUI


struct Constants {
    public static let isIphone            : Bool   = UIDevice.current.userInterfaceIdiom == .phone
    
    public static let halfTimeScoreFont   : Font   = Font.custom("GravityLabs-Italic", size: 144)
    public static let halfTimeScoreUIFont : UIFont = UIFont(name: "GravityLabs-Italic", size: 144)!
    
    public static let finalScoreFont      : Font   = Font.custom("GravityLabs-Italic", size: 100)
    public static let finalScoreUIFont    : UIFont = UIFont(name: "GravityLabs-Italic", size: 100)!
}
