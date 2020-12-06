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

    var body: some View {
        WebImage(url: user.imageURL)
            .resizable()
            .placeholder {
                Circle().foregroundColor(.gray)
            }
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(Color.blue, lineWidth: 2))
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
