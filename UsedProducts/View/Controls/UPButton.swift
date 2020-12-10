//
//  UPButton.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 10/12/2020.
//

import SwiftUI

enum ButtonType {
    case primary, secondary, borderless
}

struct PrimaryButton: View {

    let text: String

    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.bold)
            .lineLimit(1)
            .frame(maxHeight: .infinity, alignment: .center)
            .foregroundColor(Color.pink)
            .padding(8)
            .padding(.horizontal, 15)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.pink, lineWidth: 2)
            )
    }

}

struct PrimaryButtonStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
//            .fontWeight(.bold)
            .font(.headline)
            .frame(maxHeight: .infinity, alignment: .center)
            .foregroundColor(configuration.isPressed ? Color.pink : Color.pink)
            .listRowBackground(configuration.isPressed ? Color.blue.opacity(0.5) : Color.blue)
            .padding(8)
            .padding(.horizontal, 15)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.pink, lineWidth: 2)
            )
    }
}

//struct UPButton: View {
//
//    let type: ButtonType = .primary
//
//    var body: some View {
//        Button(action: {
//            print("Liked")
//        }) {
//            HStack {
//                Image(systemName: "heart.fill")
//                    .imageScale(.large)
//                Text("Primary Action")
//            }.frame(width: 30, height: 30)
//        }
//        .foregroundColor(colorForeground)
//        .background(colorBackground)
//    }
//
//    var colorBackground: some Color {
//        switch type {
//        case .primary: return .pink
//        case .secondary: return .white
//        case .borderless: return .white
//    }
//
//    var colorForeground: some Color {
//        switch type {
//        case .primary: return .pink
//        case .secondary: return .white
//        case .borderless: return .white
//        }
//    }
//}
