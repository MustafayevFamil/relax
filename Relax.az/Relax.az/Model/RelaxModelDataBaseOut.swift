//
//  RelaxModelDataBaseOut.swift
//  Relax.az
//
//  Created by Famil Mustafayev on 12.11.2020.
//  Copyright © 2020 Famil Mustafayev. All rights reserved.
//

// MARK: - RelaxModelDataBaseOut
import Foundation
import UIKit
// MARK: - RelaxModelDataBaseOut
struct RelaxModelDataBaseOut: Codable {
    let relax: [Relax]
}

// MARK: - Relax
struct Relax: Codable {
    let sehir: Sehir
    let nov: String
    let mezmun: String?
    let email: String?
    let instagramLink: String
    let id, owner, createdDate, webSite: String
    let telefon, unvan, isSaati, updatedDate: String
    let secimler: [String]?
    let gallery: [Gallery]
    let webLink: String
    let facebook: String
    let elaniVerninAdi: String?
    let title: Title
    let qiymet, instagram, foto: String
    let facebookLink: String?
    let elanAdi, linkAnaSehifeDatabaseTitle: String
    let ulduzSayi: Int?
    let secondNumberPhone, thirdPhoneNumber, metbexNovu: String?
    
    enum CodingKeys: String, CodingKey {
        case sehir, nov, mezmun, email, instagramLink
        case id = "_id"
        case owner = "_owner"
        case createdDate = "_createdDate"
        case webSite, telefon, unvan, isSaati
        case updatedDate = "_updatedDate"
        case secimler, gallery, webLink, facebook, elaniVerninAdi, title, qiymet, instagram, foto, facebookLink, elanAdi
        case linkAnaSehifeDatabaseTitle = "link-ana-sehife-database-title"
        case ulduzSayi, secondNumberPhone, thirdPhoneNumber, metbexNovu
    }
}

// MARK: - Gallery
struct Gallery: Codable {
    let slug, src: String
    let title: String?
    let type: TypeEnum
    let settings: Settings?
    let galleryDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case slug, src, title, type, settings
        case galleryDescription = "description"
    }
}

// MARK: - Settings
struct Settings: Codable {
}

enum TypeEnum: String, Codable {
    case image = "image"
}

enum Sehir: String, Codable {
    case baki = "Baki"
    case bakı = "Bakı"
    case sehirBakı = "Bakı "
}

enum Title: String, Codable {
    case alışVeriş = "Alış-veriş"
    case hotel = "Hotel"
    case restoran = "Restoran"
    case titleHotel = "Hotel "
}
