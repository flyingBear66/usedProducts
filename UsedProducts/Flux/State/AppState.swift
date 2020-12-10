//
//  AppState.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 24/11/2020.
//

import Foundation
import SwiftUIFlux

struct AppState: FluxState, Codable {

    var productsState: ProductsState
    var messagesState: MessagesState
    var notificationsState: NotificationsState

    init() {
        self.productsState = ProductsState()
        self.messagesState = MessagesState()
        self.notificationsState = NotificationsState()
    }
}
