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
}

let sampleProduct = Product(id: 0, title: "Used Product")


struct ProductDetail: Codable, Identifiable {

    let product: Product

    let moreInfo: String
}

let sampleProductDetail = ProductDetail(id: 0, product: sampleProduct)
