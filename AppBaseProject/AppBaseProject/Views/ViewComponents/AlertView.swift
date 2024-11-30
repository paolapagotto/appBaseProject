//
//  Untitled.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 30/11/2024.
//

import Foundation
import SwiftUI

struct AlertPath {

    var alert: AlertDisplayableProtocol?

    mutating func setAlert<T>(_ alert: T) where T: AlertDisplayableProtocol {
        self.alert = alert
    }
}

protocol AlertDisplayableProtocol {
    var title: String { get }
    var message: String? { get }
    var buttons: [AlertButton] { get }
}

struct AlertDisplayable: AlertDisplayableProtocol {
    let title: String
    let message: String?
    let buttons: [AlertButton]
}

struct AlertButton: Identifiable {
    let id: UUID = UUID()
    let title: String
    let role: ButtonRole?
    let action: () -> Void

    init(title: String, role: ButtonRole?, action: @escaping () -> Void) {
        self.title = title
        self.role = role
        self.action = action
    }
    
    static func actionButton(title: String, action: @escaping () -> Void) -> Self {
        AlertButton(title: title, role: nil, action: action)
    }

    static func cancelButton(title: String, action: @escaping () -> Void) -> Self {
        AlertButton(title: title, role: .cancel, action: action)
    }

    static func destructiveButton(title: String, action: @escaping () -> Void) -> Self {
        AlertButton(title: title, role: .destructive, action: action)
    }
}

enum SomeAlert: AlertDisplayableProtocol {
    case alert(buttons: [AlertButton]) // <-- we inject our actions
    case alertWithTitleAndMessage(buttons: [AlertButton])

    var title: String {
        switch self {
        case .alert: return "Alert with just title"
        case .alertWithTitleAndMessage: return "Alert with title and message"
        }
    }

    var message: String? {
        switch self {
        case .alert: return nil
        case .alertWithTitleAndMessage: return "This is the message"
        }
    }

    var buttons: [AlertButton] {
        switch self {
        case .alert(let buttons), .alertWithTitleAndMessage(let buttons):
            return buttons
        }
    }
}

struct SomeSpecificAlertType: AlertDisplayableProtocol {
    var title: String = "Some specific alert title"
    var message: String? = "Some other specific message"
    var buttons: [AlertButton]

    init(onAction: @escaping () -> Void, onCancel: @escaping () -> Void) { // <- Inject actions and handle them accordingly
      self.buttons = [
          .actionButton(title: "Action Secondary", action: onAction),
          .cancelButton(title: "Action Cancel", action: onCancel)
      ]
    }
}
