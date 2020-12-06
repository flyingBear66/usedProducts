//
//  Message.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 05/12/2020.
//

import Foundation

struct Message: Codable, Identifiable {

    let id: Int

    let user: User

    let sentDate: Date

    let product: Product

    let text: String
}

