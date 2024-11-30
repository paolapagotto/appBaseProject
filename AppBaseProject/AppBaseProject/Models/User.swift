//
//  User.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 30/11/2024.
//

import Foundation

struct User: Encodable, Identifiable, Hashable, Equatable {
    let id = UUID()
    var name: String
    var email: String
    var city: String
    var password: String
}
