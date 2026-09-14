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
    
    let images = [
        GalleryImage(imageName: "Alba_Berlin", city: "Berlin"),
        GalleryImage(imageName: "Basketball_Löwen_Erfurt", city: "Erfurt"),
        GalleryImage(imageName: "Baskets_Juniors_Oldenburg", city: "Oldenburg"),
        GalleryImage(imageName: "Bayer_Giants_Leverkusen", city: "Leverkusen"),
        GalleryImage(imageName: "Berlin_Dreams", city: "Berlin"),
        GalleryImage(imageName: "Cybex_Talents_Bayreuth", city: "Bayreuth"),
        GalleryImage(imageName: "Dresden_Titans", city: "Dresden"),
        GalleryImage(imageName: "Eintracht_Frankfurt_Skyliners", city: "Frankfurt"),
        GalleryImage(imageName: "Eisbären_Bremerhaven", city: "Bremerhaven"),
        GalleryImage(imageName: "FC_Bayern_München", city: "München"),
        GalleryImage(imageName: "Freak_City_Bamberg", city: "Bamberg"),
        GalleryImage(imageName: "Hakro_Merlins_Crailsheim", city: "Crailsheim"),
        GalleryImage(imageName: "Hamburg_Towers", city: "Hamburg"),
        GalleryImage(imageName: "IBAM", city: "München"),
        GalleryImage(imageName: "Mitteldeutsche_Basketball_Akademie", city: "Dessau"),
        GalleryImage(imageName: "Niners_Chemnitz", city: "Chemnitz"),
        GalleryImage(imageName: "Nürnberg_Falcons", city: "Nürnberg"),
        GalleryImage(imageName: "Orange_Academy", city: "Weißenhorn"),
        GalleryImage(imageName: "Paderborn_Baskets", city: "Paderborn"),
        GalleryImage(imageName: "Porsche_BBA_Ludwigsburg", city: "Ludwigsburg"),
        GalleryImage(imageName: "Rasta_Academy", city: "Vechta"),
        GalleryImage(imageName: "Ratiopharm_Ulm", city: "Ulm"),
        GalleryImage(imageName: "Rhein_Neckar_Metropolitans", city: "Mannheim"),
        GalleryImage(imageName: "Rheinstars_Köln", city: "Köln"),
        GalleryImage(imageName: "Rostock_Seawolfs", city: "Rostock"),
        GalleryImage(imageName: "Roth_Energie_BBA_Giessen", city: "Giessen"),
        GalleryImage(imageName: "Sartorius_Juniors", city: "Göttingen"),
        GalleryImage(imageName: "Science_City_Jena", city: "Jena"),
        GalleryImage(imageName: "SG_Junior_Löwen_Braunschweig", city: "Braunschweig"),
        GalleryImage(imageName: "Team_Bonn_Rhöndorf", city: "Bonn"),
        GalleryImage(imageName: "Team_Südhessen", city: "Weiterstadt"),
        GalleryImage(imageName: "Team_Urspring", city: "Ehingen"),
        GalleryImage(imageName: "TG_Hanau", city: "Hanau"),
        GalleryImage(imageName: "TS_Jahn_München", city: "München"),
        GalleryImage(imageName: "TSV_München_Ost", city: "München"),
        GalleryImage(imageName: "UBC_Münster", city: "Münster"),
        GalleryImage(imageName: "Westdogs_Basketball", city: "Düsseldorf"),
        GalleryImage(imageName: "Wildcats_Hamburg", city: "Hamburg"),
        GalleryImage(imageName: "Würzburg_Baskets", city: "Würzburg"),
        GalleryImage(imageName: "YoungRastaDragons", city: "Quakenbrück")

    ]
        
    @State private var selectedImageID: UUID? {
        didSet {
            self.model.selectedOponentLogo = images.first(where: { $0.id == self.selectedImageID })
        }
    }

    var body: some View {
        VStack(spacing: 30) {            
            // Horizontal Gallery Container
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(images) { item in
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
                            .buttonStyle(.plain) // Prevents global button styling quirks
                            
                            Text(item.city)
                                .font(.system(size: 10))
                                .foregroundStyle(isSelected ? Color.accentColor : .primary)
                        }
                    }
                }
                .padding(.horizontal)
                .frame(height: 140)
            }
        }
        .padding()
        .onAppear {
            // Automatically select the first item on load
            if selectedImageID == nil {
                selectedImageID = images.first?.id
            }
        }
    }
}
