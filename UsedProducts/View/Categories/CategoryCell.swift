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
    var imageName: String{
        switch self {
        case .electronic: return "iphone.homebutton"
        case .sportAndOutdoor: return "sportscourt"
        default: return "swift"
        }
    }

    var background: some View {

        switch self {
        case .electronic: return Color.blue
        case .sportAndOutdoor: return Color.green
        default: return Color.gray
        }
    }

    var title: String {
        switch self {
        case .electronic: return "ELECTRONIC"
        case .sportAndOutdoor: return "SPORT AND OUTDOOR"
        default: return "OTHER"
        }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCell(category: .electronic)
            .frame(width: 20, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}
