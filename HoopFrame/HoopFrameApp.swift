//
//  HoopFrameApp.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 11.09.26.
//

import SwiftUI

@main
struct HoopFrameApp: App {
    let model : HoopFrameModel = HoopFrameModel()
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(self.model)
        }        
    }
}
