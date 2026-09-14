//
//  GalleryImage.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 11.09.26.
//

import Foundation
import SwiftUI


struct GalleryImage: Identifiable {
    let id       : UUID = UUID()
    let imageName: String
    let city     : String
}
