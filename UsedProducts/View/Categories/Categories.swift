//
//  Categories.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 06/12/2020.
//

import SwiftUI
import SwiftUIFlux

struct Categories: ConnectedView {

    struct Props { }

    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props()
    }

    func body(props: Props) -> some View {
        ScrollView(.horizontal) {
            HStack(alignment: .center, spacing: 4) {
                ForEach(Category.allCases, id: \.self) { category in
                    CategoryCell(category: category)
                }
            }
        }
    }

}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        Categories()
    }
}
