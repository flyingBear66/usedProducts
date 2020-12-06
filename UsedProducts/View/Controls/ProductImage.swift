//
//  ProductImage.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 06/12/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProductImage: View {
    let message: Message

    var body: some View {
        WebImage(url: message.productImage)
            .resizable()
            .placeholder {
                Rectangle().foregroundColor(.gray)
            }
            .clipShape(Rectangle())
            .shadow(radius: 10)
            .cornerRadius(8)
    }
}


private extension Message {

    var productImage: URL? {
        URL(string: product.image)
    }
}

