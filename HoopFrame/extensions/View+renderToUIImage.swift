//
//  View+renderToUIImage.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 19.09.26.
//

import Foundation
import SwiftUI


extension View {
    @MainActor
    func asUIImage(displayScale: CGFloat = 1.0) -> UIImage? {
        let renderer = ImageRenderer(content: self)
        renderer.scale = displayScale //UITraitCollection.current.displayScale
        return renderer.uiImage
    }
}
