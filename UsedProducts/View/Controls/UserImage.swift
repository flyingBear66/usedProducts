//
//  UserImage.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 06/12/2020.
//

import SwiftUI
import SDWebImageSwiftUI

struct UserImage: View {

    let user: User
    let isBordered: Bool

    init(user: User, isBordered: Bool = false) {
        self.user = user
        self.isBordered = isBordered
    }

    var body: some View {
        WebImage(url: user.imageURL)
            .resizable()
            .placeholder {
                Circle().foregroundColor(.gray)
            }
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.blue, lineWidth: isBordered ? 2 : 0))
    }
}

private extension User {
    var imageURL: URL? {
        URL(string: image)
    }
}

//struct UserImage_Previews: PreviewProvider {
//    static var previews: some View {
//        UserImage(message: sampleMessage1)
//    }
//}
