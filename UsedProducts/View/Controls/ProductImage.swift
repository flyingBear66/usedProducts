//
//  ProductImage.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 06/12/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductImage: View {
    let product: Product

    var body: some View {
        WebImage(url: product.productImage)
            .resizable()
            .placeholder {
                Rectangle().foregroundColor(.gray)
            }
            .clipShape(Rectangle())
            .shadow(radius: 10)
            .cornerRadius(8)
    }
}

private extension Product {

    var productImage: URL? {
        URL(string: image)
    }
}
