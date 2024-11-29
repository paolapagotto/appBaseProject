//
//  CoordinatorProtocol.swift
//  AppBaseProject
//
//  Created by Paola Pagotto on 29/11/2024.
//

import Foundation
import SwiftUI

protocol CoordinatorProtocol: AnyObject {
    func push(next screenRoute: Route)
    func presentSheet(sheet: Route)
    func presentFullScreenCover(cover: Route)
    func popBack()
    func popToRoot()
    func dismissSheet()
    func dismissFullScreenCover()
}
