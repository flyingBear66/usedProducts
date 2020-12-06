//
//  MessagesState.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 05/12/2020.
//

import Foundation
import SwiftUIFlux

struct MessagesState: FluxState, Codable {
    var messages: [Message] = []

    enum CodingKeys: String, CodingKey {
        case messages
    }
}
