//
//  ProductsState.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 24/11/2020.
//

import Foundation
import SwiftUIFlux

struct ProductsState: FluxState, Codable {
    var products: [Product] = []

    enum CodingKeys: String, CodingKey {
        case products
    }
}
