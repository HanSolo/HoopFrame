//
//  HorizontalGalleryView.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 11.09.26.
//

import Foundation
import SwiftUI


struct HorizontalGalleryView: View {
    @Environment(HoopFrameModel.self) private var model
    @State private var selectedImageID: String? {
        didSet {
            switch self.model.activeLogoTarget {
                case .home:
                    self.model.homeLogo     = Constants.logos.first(where: { $0.id == self.selectedImageID })
                case .opponent:
                    self.model.opponentLogo = Constants.logos.first(where: { $0.id == self.selectedImageID })
                case .none:
                    break // picker should already be non-interactive, but this is a safety fallback
            }
        }
    }

    
    var body: some View {
        VStack(spacing: 30) {            
            // Horizontal Gallery Container
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(Constants.logos) { item in
                        let isSelected = selectedImageID == item.id
                        
                        VStack {
                            Button {
                                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                                    selectedImageID = item.id
                                }
                            } label: {
                                Image(item.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .padding(20)
                                    .frame(width: 120, height: 120)
                                    .background(Color(.systemBackground))
                                    .foregroundStyle(.primary)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                                    )
                                    .scaleEffect(isSelected ? 1.08 : 1.0)
                            }
                            .buttonStyle(.plain)
                            
                            Text(item.city)
                                .font(.system(size: 10))
                                .foregroundStyle(isSelected ? Color.orange : .primary)
                        }
                    }
                }
                .scrollTargetLayout()
                .padding(.horizontal)
                .frame(height: 140)
            }
            .scrollPosition(id: $selectedImageID)
        }
        .disabled(self.model.activeLogoTarget == .none)        
        .onAppear {
            if selectedImageID == nil {
                switch self.model.activeLogoTarget {
                    case .home    : self.selectedImageID = self.model.homeLogo?.team
                    case .opponent: self.selectedImageID = self.model.opponentLogo?.team
                    case .none    : break
                }
            }
        }
    }
}
