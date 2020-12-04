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
}

let sampleProduct1 = Product(id: 0, title: "Used Product 1", image: "https://picsum.photos")
let sampleProduct2 = Product(id: 1, title: "Used Product 2", image: "https://picsum.photos")
let sampleProduct3 = Product(id: 2, title: "Used Product 3", image: "https://picsum.photos")
