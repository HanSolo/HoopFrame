//
//  Constants.swift
//  HoopFrame
//
//  Created by Gerrit Grunwald on 11.09.26.
//

import Foundation
import SwiftUI


struct Constants {
    public static let appName             : String = "HoopFrame"
    public static let appGroupId          : String = "group.eu.hansolo.HoopFrame"
    public static let containerId         : String = "iCloud.eu.hansolo.HoopFrameContainer"
    
    public static let isIphone            : Bool   = UIDevice.current.userInterfaceIdiom == .phone
    
    public static let halfTimeScoreFont   : Font   = Font.custom("GravityLabs-Italic", size: 144)
    public static let halfTimeScoreUIFont : UIFont = UIFont(name: "GravityLabs-Italic", size: 144)!
    
    public static let finalScoreFont      : Font   = Font.custom("GravityLabs-Italic", size: 100)
    public static let finalScoreUIFont    : UIFont = UIFont(name: "GravityLabs-Italic", size: 100)!
    
    public static let logos = [
        GalleryImage(imageName: "Alba_Berlin", city: "Berlin", team: "Alba Berlin"),
        GalleryImage(imageName: "Basketball_Löwen_Erfurt", city: "Erfurt", team: "Basketball Löwen Erfurt"),
        GalleryImage(imageName: "Baskets_Juniors_Oldenburg", city: "Oldenburg", team: "Baskets Juniors Oldenburg"),
        GalleryImage(imageName: "Bayer_Giants_Leverkusen", city: "Leverkusen", team: "Bayer Giants Leverkusen"),
        GalleryImage(imageName: "Berlin_Dreams", city: "Berlin", team: "Berlin Dreams"),
        GalleryImage(imageName: "Cybex_Talents_Bayreuth", city: "Bayreuth", team: "Cybex Talents Bayreuth"),
        GalleryImage(imageName: "Dresden_Titans", city: "Dresden", team: "Dresden Titans"),
        GalleryImage(imageName: "Eintracht_Frankfurt_Skyliners", city: "Frankfurt", team: "Eintracht Frankfurt Skyliners"),
        GalleryImage(imageName: "Eisbären_Bremerhaven", city: "Bremerhaven", team: "Eisbären Bremerhaven"),
        GalleryImage(imageName: "FC_Bayern_München", city: "München", team: "FC Bayern München"),
        GalleryImage(imageName: "Freak_City_Bamberg", city: "Bamberg", team: "Freak City Bamberg"),
        GalleryImage(imageName: "Hakro_Merlins_Crailsheim", city: "Crailsheim", team: "Hakro Merlins Crailsheim"),
        GalleryImage(imageName: "Hamburg_Towers", city: "Hamburg", team: "Hamburg Towers"),
        GalleryImage(imageName: "IBAM", city: "München", team: "IBAM"),
        GalleryImage(imageName: "Mitteldeutsche_Basketball_Akademie", city: "Dessau", team: "Mitteldeutsche Basketball Akademie"),
        GalleryImage(imageName: "Niners_Chemnitz", city: "Chemnitz", team: "Niners Chemnitz"),
        GalleryImage(imageName: "Nürnberg_Falcons", city: "Nürnberg", team: "Nürnberg Falcons"),
        GalleryImage(imageName: "Orange_Academy", city: "Weißenhorn", team: "Orange Academy"),
        GalleryImage(imageName: "Paderborn_Baskets", city: "Paderborn", team: "Paderborn Baskets"),
        GalleryImage(imageName: "Porsche_BBA_Ludwigsburg", city: "Ludwigsburg", team: "Porsche BBA Ludwigsburg"),
        GalleryImage(imageName: "Rasta_Academy", city: "Vechta", team: "Rasta Academy"),
        GalleryImage(imageName: "Ratiopharm_Ulm", city: "Ulm", team: "Ratiopharm Ulm"),
        GalleryImage(imageName: "Rhein_Neckar_Metropolitans", city: "Mannheim", team: "Rhein-Neckar Metropolitans"),
        GalleryImage(imageName: "Rheinstars_Köln", city: "Köln", team: "Rheinstars Köln"),
        GalleryImage(imageName: "Rostock_Seawolfs", city: "Rostock", team: "Rostock Seawolves"),
        GalleryImage(imageName: "Roth_Energie_BBA_Giessen", city: "Giessen", team: "Roth-Energie BBA Giessen"),
        GalleryImage(imageName: "Sartorius_Juniors", city: "Göttingen", team: "Sartorius Juniors"),
        GalleryImage(imageName: "Science_City_Jena", city: "Jena", team: "Science City Jena"),
        GalleryImage(imageName: "SG_Junior_Löwen_Braunschweig", city: "Braunschweig", team: "SG Junior Löwen Braunschweig"),
        GalleryImage(imageName: "Team_Bonn_Rhöndorf", city: "Bonn", team: "Team Bonn-Rhöndorf"),
        GalleryImage(imageName: "Team_Südhessen", city: "Weiterstadt", team: "Team Südhessen"),
        GalleryImage(imageName: "Team_Urspring", city: "Ehingen", team: "Team Urspring"),
        GalleryImage(imageName: "TG_Hanau", city: "Hanau", team: "TG Hanau"),
        GalleryImage(imageName: "TS_Jahn_München", city: "München", team: "TS Jahn München"),
        GalleryImage(imageName: "TSV_München_Ost", city: "München", team: "TSV München Ost"),
        GalleryImage(imageName: "UBC_Münster", city: "Münster", team: "UBC Münster"),
        GalleryImage(imageName: "Westdogs_Basketball", city: "Düsseldorf", team: "Westdogs Basketball"),
        GalleryImage(imageName: "Wildcats_Hamburg", city: "Hamburg", team: "Wildcats Hamburg"),
        GalleryImage(imageName: "Würzburg_Baskets", city: "Würzburg", team: "Würzburg Baskets"),
        GalleryImage(imageName: "YoungRastaDragons", city: "Quakenbrück", team: "Young Rasta Dragons")
    ]
}
