//
//  HoopFrameModel.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 11.09.26.
//

import Foundation
import SwiftUI


@MainActor @Observable
public class HoopFrameModel {
    var period              : Period = .halftime
    var periodBinding       : Binding<Period> {
        Binding(get: { self.period }, set: { self.period = $0 })
    }
    var orgImage            : UIImage?
    var bkgImage            : UIImage? {
        didSet {
            switch self.period {
                case .halftime:
                    if self.bkgImage != nil && self.halfTimeFgdImg != nil {
                        self.mergedImage = bkgImage!.mergeWith(topImage: self.halfTimeFgdImg!)
                        debugPrint("Merged halftime score image with selected photo")
                    } else {
                        self.mergedImage = nil
                        debugPrint("\(self.bkgImage == nil ? "bkgImage == nil" : "") \(self.halfTimeFgdImg == nil ? "halfTimeFgdImg == nil" : "")")
                    }
                case .final:
                    if self.bkgImage != nil && self.finalFgdImg != nil {
                        self.mergedImage = bkgImage!.mergeWith(topImage: self.finalFgdImg!)
                        debugPrint("Merged final score image with selected photo")
                    } else {
                        self.mergedImage = nil
                        debugPrint("\(self.bkgImage == nil ? "bkgImage == nil" : "") \(self.finalFgdImg == nil ? "finalFgdImg == nil" : "")")
                    }
            }
        }
    }
    var halfTimeFgdImg      : UIImage?
    var finalFgdImg         : UIImage?
    var mergedImage         : UIImage?    
    var scoreDragons        : Int = 0
    var scoreDragonsBinding : Binding<Int> {
        Binding(get: { self.scoreDragons }, set: { self.scoreDragons = $0 })
    }
    var scoreOponent        : Int = 0
    var scoreOponentBinding : Binding<Int> {
        Binding(get: { self.scoreOponent }, set: { self.scoreOponent = $0 })
    }
    var selectedOponentLogo : GalleryImage?
}
