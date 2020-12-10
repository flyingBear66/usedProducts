//
//  NotificationsState.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 09/12/2020.
//

import Foundation
import SwiftUIFlux

struct NotificationsState: FluxState, Codable {
    var notifications: [Notification] = []

    enum CodingKeys: String, CodingKey {
        case notifications
    }
}
