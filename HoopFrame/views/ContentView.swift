//
//  ContentView.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 11.09.26.
//

import SwiftUI
import PhotosUI

// 1080x1350

struct ContentView: View {
    @Environment(HoopFrameModel.self) private var model
        
    @State private var photoItem     : PhotosPickerItem?
    @State private var selectedImage : Image?
    @State private var width         : CGFloat?
    @State private var height        : CGFloat?
    @State private var selection     : TextSelection?
    
    @FocusState private var isInputFocused: Bool
    
    let options : [Period] = [.halftime, .final]
        
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 10) {
                Picker("Select Option", selection: self.model.periodBinding) {
                    ForEach(options, id: \.self) { option in
                        Text(option.name())
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                ZStack {
                    let isHalfTime : Bool = self.model.period == .halftime
                    
                    if self.model.bkgImage != nil {
                        // Selected basketball photo
                        Image(uiImage: self.model.bkgImage!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 324, height: 405)
                            .cornerRadius(10)
                    }
                    
                    // Foreground template depending on selected period
                    switch self.model.period {
                        case .final:
                            if self.model.finalFgdImg != nil {
                                Image(uiImage: self.model.finalFgdImg!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 324, height: 405)
                                    .cornerRadius(10)
                                    .allowsHitTesting(false)
                            }
                        case .halftime:
                            if self.model.halfTimeFgdImg != nil {
                                Image(uiImage: self.model.halfTimeFgdImg!)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 324, height: 405)
                                    .cornerRadius(10)
                                    .allowsHitTesting(false)
                            }
                    }
                    
                    // Score image Home team
                    Image(uiImage: scoreToImage(score: self.model.scoreHome, isOponent: false)!)
                        .resizable()
                        .allowsHitTesting(false)
                    
                    // Home logo image
                    if self.model.homeLogo != nil {
                        Image(self.model.homeLogo!.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .foregroundStyle(.blue)
                            .transition(.scale.combined(with: .opacity))
                            .offset(x: isHalfTime ? -100 : -118, y: isHalfTime ? -110 : 160)
                            .allowsHitTesting(false)
                    }
                    
                    
                    // Score image Opponent team
                    Image(uiImage: scoreToImage(score: self.model.scoreOpponent, isOponent: true)!)
                        .resizable()
                        .allowsHitTesting(false)
                    
                    // Opponent logo image
                    if self.model.opponentLogo != nil {
                        Image(self.model.opponentLogo!.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75, height: 75)
                            .foregroundStyle(.blue)
                            .transition(.scale.combined(with: .opacity))
                            .offset(x: isHalfTime ? -100 : 118, y: isHalfTime ? 110 : 160)
                            .allowsHitTesting(false)
                    }
                }
                .frame(width: 324, height: 405)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                
                
                HStack(spacing: 12) {
                    Button("Home Logo") {
                        toggleLogoTarget(.home)
                    }
                    .background(self.model.activeLogoTarget == .home ? Color.orange : Color.clear)
                    .foregroundColor(self.model.activeLogoTarget == .home ? .white : .gray)
                    .font(.system(size: 10, weight: .medium, design: .rounded))
                    .clipShape(Capsule())
                    .buttonStyle(.glass)
                    
                    Button("Opponent Logo") {
                        toggleLogoTarget(.opponent)
                    }
                    .background(self.model.activeLogoTarget == .opponent ? Color.orange : Color.clear)
                    .foregroundColor(self.model.activeLogoTarget == .opponent ? .white : .gray)
                    .font(.system(size: 10, weight: .medium, design: .rounded))
                    .clipShape(Capsule())
                    .buttonStyle(.glass)
                }
                
                if self.model.activeLogoTarget != .none {
                    HorizontalGalleryView()
                }
                                                
                HStack(alignment: .center) {                    
                    Spacer()
                    Text(self.model.homeLogo == nil ? "Home" : self.model.homeLogo!.city)
                    TextField("", value: self.model.scoreHomeBinding, formatter: NumberFormatter())
                        .focused($isInputFocused)
                        .cornerRadius(5)
                        .shadow(color: isInputFocused ? Color.orange.opacity(0.5) : Color.clear, radius: 8, x: 0, y: 4)
                        .onChange(of: isInputFocused) { _, focused in
                            if focused {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                    UIApplication.shared.sendAction(
                                        #selector(UIResponder.selectAll(_:)),
                                        to: nil,
                                        from: nil,
                                        for: nil
                                    )
                                }
                            }
                        }
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .frame(maxWidth: 40)
                        .multilineTextAlignment(.trailing)
                        .onChange(of: self.model.scoreHome) { oldValue, newValue in
                            if newValue < 0 {
                                self.model.scoreHome = 0
                            } else if newValue > 180 {
                                self.model.scoreHome = 180
                            }
                        }
                    Text(":")
                    TextField("", value: self.model.scoreOpponentBinding, formatter: NumberFormatter())
                        .focused($isInputFocused)
                        .cornerRadius(5)
                        .shadow(color: isInputFocused ? Color.orange.opacity(0.5) : Color.clear, radius: 8, x: 0, y: 4)
                        .onChange(of: isInputFocused) { _, focused in
                            if focused {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                                    UIApplication.shared.sendAction(
                                        #selector(UIResponder.selectAll(_:)),
                                        to: nil,
                                        from: nil,
                                        for: nil
                                    )
                                }
                            }
                        }
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .frame(maxWidth: 40)
                        .onChange(of: self.model.scoreOpponent) { oldValue, newValue in
                            if newValue < 0 {
                                self.model.scoreOpponent = 0
                            } else if newValue > 180 {
                                self.model.scoreOpponent = 180
                            }
                        }
                        .toolbar {
                            ToolbarItemGroup(placement: .keyboard) {
                                Spacer()
                                Button("Done") {
                                    isInputFocused = false
                                }
                                .fontWeight(.bold)
                            }
                        }
                    Text(self.model.opponentLogo == nil ? "Opponent" : self.model.opponentLogo!.city)
                    Spacer()
                }
                          
                HStack {
                    PhotosPicker(selection: $photoItem, matching: .images) {
                        Label("Select Photo", systemImage: "photo.fill")
                    }
                    .onChange(of: photoItem) {
                        Task {
                            if photoItem != nil {
                                do {
                                    guard let data = try await photoItem!.loadTransferable(type: Data.self) else { return }
                                    let uiImage        = UIImage(data: data)
                                    self.width         = uiImage!.size.width
                                    self.height        = uiImage!.size.height
                                    self.selectedImage = Image(uiImage: uiImage!)
                                } catch {
                                    self.selectedImage = nil
                                    self.width         = nil
                                    self.height        = nil
                                }
                            }
                        }
                    }
                    .buttonStyle(.glass)
                    .disabled(self.model.homeLogo == nil || self.model.opponentLogo == nil)
                    
                    Spacer()
                    
                    Button("Save image") {
                        if self.model.mergedImage == nil { return }
                        
                        let offsetXHome         : CGFloat
                        let offsetYHome         : CGFloat
                        let offsetXOpponent     : CGFloat
                        let offsetYOpponent     : CGFloat
                        let offsetXHomeLogo     : CGFloat
                        let offsetYHomeLogo     : CGFloat
                        let offsetXOpponentLogo : CGFloat
                        let offsetYOpponentLogo : CGFloat
                        
                        switch self.model.period {
                            case .halftime:
                                offsetXHome         = self.model.scoreHome == 1 ? 170 : self.model.scoreHome < 10 ? 145 : self.model.scoreHome == 11 ? 155 : self.model.scoreHome < 20 ? 140 : self.model.scoreHome < 99 ? 100 : 80
                                offsetYHome         = 490
                                
                                offsetXOpponent     = self.model.scoreOpponent == 1 ? 170 : self.model.scoreOpponent < 10 ? 145 : self.model.scoreOpponent == 11 ? 155 : self.model.scoreOpponent < 20 ? 140 : self.model.scoreOpponent < 99 ? 100 : 80
                                offsetYOpponent     = 750
                                
                                offsetXHomeLogo     = 75
                                offsetYHomeLogo     = 180
                            
                                offsetXOpponentLogo = 75
                                offsetYOpponentLogo = 900
                                
                            case .final:
                                offsetXHome         = self.model.scoreHome == 1 ? 460 : self.model.scoreHome < 10 ? 440 : self.model.scoreHome == 11 ? 450 : self.model.scoreHome < 20 ? 408 : self.model.scoreHome < 99 ? 372 : 350
                                offsetYHome         = 1160
                                
                                offsetXOpponent     = self.model.scoreOpponent == 1 ? 680 : self.model.scoreOpponent < 10 ? 660 : self.model.scoreOpponent == 11 ? 670 : self.model.scoreOpponent < 20 ? 628 : self.model.scoreOpponent < 99 ? 592 : 570
                                offsetYOpponent     = 1160
                                
                                offsetXHomeLogo     = 25
                                offsetYHomeLogo     = 1080
                            
                                offsetXOpponentLogo = 805
                                offsetYOpponentLogo = 1080                                                            
                        }
                                                                    
                        self.model.mergedImage = addTextToImage(drawText: "\(self.model.scoreHome)", inImage: self.model.mergedImage!, atPoint: CGPoint(x: offsetXHome, y: offsetYHome))
                        self.model.mergedImage = addTextToImage(drawText: "\(self.model.scoreOpponent)", inImage: self.model.mergedImage!, atPoint: CGPoint(x: offsetXOpponent, y: offsetYOpponent))
                        self.model.mergedImage = addLogoToImage(logo: UIImage(named: self.model.homeLogo!.imageName)!, inImage: self.model.mergedImage!, atPoint: CGPoint(x: offsetXHomeLogo, y: offsetYHomeLogo))
                        self.model.mergedImage = addLogoToImage(logo: UIImage(named: self.model.opponentLogo!.imageName)!, inImage: self.model.mergedImage!, atPoint: CGPoint(x: offsetXOpponentLogo, y: offsetYOpponentLogo))
                                                                                                              
                        //  3240 x 4050 -> 1080 x 1350
                        let targetSize  : CGSize  = CGSize(width: 1080, height: 1350)
                        guard let imageToSave = resizeImage(image: self.model.mergedImage!, targetSize: targetSize) else { return }
                                                
                        
                        let saver : ImageSaver = ImageSaver()
                        saver.successHandler   = {
                            print("Successfully saved!")
                            self.model.bkgImage    = nil
                            self.model.mergedImage = nil
                            self.selectedImage     = nil
                        }
                        saver.errorHandler     = { error in print("Failed to save: \(error.localizedDescription)") }
                        
                        saver.writeToPhotoAlbum(image: imageToSave)
                    }
                    .buttonStyle(.glass)
                    .disabled(self.model.mergedImage == nil)
                }
                .padding()
            }
            .task(id: photoItem) {
                // Load Halftime Score Template
                if let halfTimeFgdImage = UIImage(named: "HalftimeScoreForeground") {
                    self.model.halfTimeFgdImg = halfTimeFgdImage
                }
                
                // Load Final Score Template
                if let finalFgdImage = UIImage(named: "FinalScoreForeground") {
                    self.model.finalFgdImg = finalFgdImage
                }
                
                if photoItem != nil {
                    do {
                        guard let data = try await photoItem!.loadTransferable(type: Data.self) else { return }
                        self.selectedImage = Image(uiImage: UIImage(data: data)!)
                        if selectedImage == nil || self.width == nil || self.height == nil { return }
                        let size    : CGSize  = CGSize(width: 1080, height: 1350)
                        let uiImage : UIImage = selectedImage!.getUIImage(newSize: size)!
                        self.model.bkgImage = uiImage
                    } catch {
                        debugPrint("Problem loading selected photo")
                    }
                }
            }
        }
    }
    
    private func toggleLogoTarget(_ target: LogoTarget) {
        self.model.activeLogoTarget = (self.model.activeLogoTarget == target) ? .none : target
    }
            
    func addTextToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor : UIColor = UIColor.white

        let scale = UITraitCollection.current.displayScale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)

        let textFontAttributes = [
            NSAttributedString.Key.font            : self.model.period.uiFont(),
            NSAttributedString.Key.foregroundColor : textColor,
            NSAttributedString.Key.strokeColor     : UIColor.black,
            NSAttributedString.Key.strokeWidth     : -5
            ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))

        let rect : CGRect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    func addLogoToImage(logo: UIImage, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let scale = UITraitCollection.current.displayScale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect: CGRect = CGRect(origin: point, size: CGSize(width: 250, height: 250))
        logo.draw(in: rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
    
    func scoreToImage(score: Int, isOponent: Bool) -> UIImage? {
        let offsetOne : CGFloat = abs(score) % 10 == 1 ? 15 : 0
        let offsetX   : CGFloat
        let offsetY   : CGFloat
        switch self.model.period {
            case .halftime:
                offsetX = score == 1 ? 170 : score < 10 ? 145 : score == 11 ? 155 : score < 20 ? 140 : score < 99 ? 100 : 80
                offsetY = isOponent ? 750 : 490
            case .final:
                if isOponent {
                    offsetX = score == 1 ? 680 : score < 10 ? 660 : score == 11 ? 670 : score < 20 ? 628 : score < 99 ? 592 : 570
                } else {
                    offsetX = score == 1 ? 460 : score < 10 ? 440 : score == 11 ? 450 : score < 20 ? 408 : score < 99 ? 372 : 350
                }
                offsetY = 1160
        }
        let textColor : UIColor                       = UIColor.white
        let size      : CGSize                        = CGSize(width: 1080, height: 1350)
        let frame     : CGRect                        = CGRect(origin: .zero, size: size).offsetBy(dx: offsetX + offsetOne, dy: offsetY)
        let format    : UIGraphicsImageRendererFormat = UIGraphicsImageRendererFormat()
        format.scale = 1
        let textFontAttributes = [
            NSAttributedString.Key.font            : self.model.period.uiFont(),
            NSAttributedString.Key.foregroundColor : textColor,
            NSAttributedString.Key.strokeColor     : UIColor.black,
            NSAttributedString.Key.strokeWidth     : -5
            ] as [NSAttributedString.Key : Any]

        let image = UIGraphicsImageRenderer(size: size, format: format).image { ctx in
            UIColor.clear.setFill()
            ctx.fill(CGRect(origin: .zero, size: size))
            "\(score)".draw(in: frame, withAttributes: textFontAttributes)
        }
        return image
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = 1
        
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        return renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}

extension Image {
    @MainActor
    func getUIImage(newSize: CGSize) -> UIImage? {
        let image = resizable()
            .scaledToFill()
            .frame(width: newSize.width, height: newSize.height)
            .clipped()
        return ImageRenderer(content: image).uiImage
    }
}
