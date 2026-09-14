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
    var period               : Period = .halftime
    var periodBinding        : Binding<Period> {
        Binding(get: { self.period }, set: { self.period = $0 })
    }
    var orgImage             : UIImage?
    var bkgImage             : UIImage? {
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
    var halfTimeFgdImg       : UIImage?
    var finalFgdImg          : UIImage?
    var mergedImage          : UIImage?
    var scoreHome            : Int = 0
    var scoreHomeBinding     : Binding<Int> {
        Binding(get: { self.scoreHome }, set: { self.scoreHome = $0 })
    }
    var scoreOpponent        : Int = 0
    var scoreOpponentBinding : Binding<Int> {
        Binding(get: { self.scoreOpponent }, set: { self.scoreOpponent = $0 })
    }
    
    var activeLogoTarget     : LogoTarget = .none
    var homeLogo             : GalleryImage? = Constants.logos.first(where: { $0.id == Properties.instance.homeTeamLogo! }) {
        didSet {
            Properties.instance.homeTeamLogo = self.homeLogo == nil ? "" : self.homeLogo!.id
        }
    }
    var opponentLogo         : GalleryImage? = Constants.logos.first(where: { $0.id == Properties.instance.opponentTeamLogo! }) {
        didSet {
            Properties.instance.opponentTeamLogo = self.opponentLogo == nil ? "" : self.opponentLogo!.id
        }
    }
}
