//
//  Product.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 24/11/2020.
//

import Foundation

struct Product: Codable, Identifiable {
    
    let id: Int

    let title: String

    let image: String

    let publishedDate: Date

    let owner: User

    let price: Price

    struct Price: Codable {

        let amount: Float

        let locale: Locale
    }
}
