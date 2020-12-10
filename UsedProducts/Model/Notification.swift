//
//  Notification.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 09/12/2020.
//

import Foundation

struct Notification: Codable, Identifiable {

    let id: Int

    let title: String

    let user: User

    let product: Product

    let action: Action

    struct Action: Codable {

        let text: String

        let type: Kind

        enum Kind: Int, Codable {
            case openProfile, openMessages, openProductDetail
        }
    }
}
