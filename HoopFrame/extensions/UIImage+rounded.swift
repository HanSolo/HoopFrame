//
//  UIImage+rounded.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 11.09.26.
//

import Foundation
import SwiftUI


extension UIImage {
    func rounded(cornerRadius: CGFloat) -> UIImage? {
        let rect : CGRect = CGRect(origin: .zero, size: size)
        return UIGraphicsImageRenderer(size: size).image { _ in
            UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).addClip()
            draw(in: rect)
        }
    }
}
