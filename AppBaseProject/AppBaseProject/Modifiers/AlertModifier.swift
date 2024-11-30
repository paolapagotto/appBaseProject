//
//  AlertModifier.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 30/11/2024.
//

import SwiftUI

struct AlertModifier: ViewModifier {

    @Binding var alertPath: AlertPath

    init(alertPath: Binding<AlertPath>) {
        self._alertPath = alertPath
    }

    func body(content: Content) -> some View {
        content
            .alert(
                alertPath.alert?.title ?? "",
                isPresented: Binding(get: { alertPath.alert != nil }, set: { _ in
                    alertPath.alert = nil
                }),
                actions: {
                    if let buttons = alertPath.alert?.buttons {
                        ForEach(buttons) { button in
                            Button(button.title, role: button.role, action: button.action)
                        }
                    }

                }, message: {
                    if let message = alertPath.alert?.message {
                        Text(message)
                    }
                })
    }
}
