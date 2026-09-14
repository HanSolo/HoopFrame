//
//  GalleryImage.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 11.09.26.
//

import Foundation
import SwiftUI


struct GalleryImage: Identifiable {
    let id       : String //UUID = UUID()
    let imageName: String
    let city     : String
    let team     : String
    
    init(imageName: String, city: String, team: String) {
        self.id        = team
        self.imageName = imageName
        self.city      = city
        self.team      = team
    }
}
