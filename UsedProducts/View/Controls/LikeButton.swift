//
//  LikeButton.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 06/12/2020.
//

import SwiftUI

struct LikeButton: View {

    let selected: Bool

    var body: some View {
        Button(action: {
            print("Liked")
        }) {
            HStack {
                Image(systemName: "heart.fill")
                    .imageScale(.large)
            }.frame(width: 30, height: 30)
        }
        .foregroundColor(selected ? .pink : .white)
    }
}

struct LikedView: View {

    let selected: Bool

    var body: some View {
        ZStack {
            Circle().foregroundColor(.white)
            Image(systemName: "heart.fill")
                .foregroundColor(selected ? .pink : .gray)
        }
        .shadow(radius: 10)
    }
}

struct LikeButton_Previews: PreviewProvider {
    static var previews: some View {
        LikeButton(selected: true)
    }
}
