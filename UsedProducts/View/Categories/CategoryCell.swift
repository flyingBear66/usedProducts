//
//  CategoryCell.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 06/12/2020.
//

import SwiftUI

struct CategoryCell: View {

    let category: Category
    private let width: CGFloat = 80
    private let imageWidth: CGFloat = 60

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: category.imageName)
                .foregroundColor(.white)
                .imageScale(.large)
                .frame(width: imageWidth, height: imageWidth, alignment: .center)
                .background(category.background)
                .cornerRadius(imageWidth/2)

            Text(category.title)
                .frame(width: width)
                .font(Font.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)

            Spacer()

        }.frame(width: width)
        .padding(.top)
    }
}

extension Category {

    var imageName: String {

        switch self {
        case .electronic: return "iphone.homebutton"
        case .sportAndOutdoor: return "sportscourt"
        case .car: return "car"
        case .otherVehicles: return "bicycle"
        case .game: return "swift"
        case .cloth: return "person.3.fill"
        case .homeStuff: return "homepod.fill"
        case .realEstate: return "house.fill"
        case .music: return "music.quarternote.3"
        }
    }

    var background: some View {

        switch self {
        case .electronic: return Color.blue
        case .sportAndOutdoor: return Color.green
        case .car: return Color.red
        case .otherVehicles: return Color.purple
        case .game: return Color.gray
        case .cloth: return Color.pink
        case .homeStuff: return Color.yellow
        case .realEstate: return Color.orange
        case .music: return Color.black
        }
    }

    var title: String {

        switch self {
        case .electronic: return "ELECTRONIC"
        case .sportAndOutdoor: return "SPORT AND OUTDOOR"
        case .car: return "CAR"
        case .otherVehicles: return "OTHER VEHICLES"
        case .game: return "GAME"
        case .cloth: return "CLOTH"
        case .homeStuff: return "HOME"
        case .realEstate: return "REAL ESTATE"
        case .music: return "MUSIC"
        }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(category: .electronic)
            .frame(width: 20, height: 20, alignment: .center)
    }
}
