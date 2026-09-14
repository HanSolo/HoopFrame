//
//  UIImage+resized.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 11.09.26.
//

import Foundation
import SwiftUI


extension UIImage {

    func resized(to targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}
