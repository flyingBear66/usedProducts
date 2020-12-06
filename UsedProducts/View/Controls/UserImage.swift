//
//  UserImage.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 06/12/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserImage: View {
    let message: Message

    var body: some View {
        WebImage(url: message.ownerImage)
            .resizable()
            .placeholder {
                Circle().foregroundColor(.gray)
            }
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
    }
}

private extension Message {
    var ownerImage: URL? {
        URL(string: user.image)
    }
}
