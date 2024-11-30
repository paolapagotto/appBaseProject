//
//  Image+Extensions.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 30/11/2024.
//

import Foundation
import SwiftUI

enum ImageName: String {
    
    case person = "person.fill"
    case eye = "eye"
    case eyeSlash = "eye.slash"
    case checkMarkFilled = "checkmark.circle.fill"
    case checkmark = "checkmark.circle"
    case home = "house.circle.fill"
    case search = "magnifyingglass.circle.fill"
    case shop = "cart.circle.fill"
    case profile = "person.circle.fill"
    case logo = "logo"
    case tamagotchi = "tamagotchi1"
    case tamagotchiInner = "tamagotchi2"
    case tamagotchiLogin = "tamagotchi"
    
    case dino1 = "dino1"
    case dino2 = "dino2"
    case dino3 = "dino3"
    case dino4 = "dino4"
    case dino5 = "dino5"
    case dino6 = "dino6"
    case dino7 = "dino7"
    case dino8 = "dino8"
    case dino9 = "dino9"
    
    case none = ""
}

extension Image {
    init(name: ImageName) {
        self.init(name.rawValue)
    }
    
    init(sysNameImage: ImageName) {
        self.init(systemName: sysNameImage.rawValue)
    }
}
