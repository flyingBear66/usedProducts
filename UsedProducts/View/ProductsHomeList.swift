//
//  ProductsHomeList.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 29/11/2020.
//

import SwiftUI
import Combine
import SwiftUIFlux

struct ProductsHomeList: ConnectedView {
    typealias StoreState = <#type#>

    typealias V = type

    typealias Body = <#type#>

    struct Props {
        let products: [Int]
    }

//    @Binding var menu: MoviesMenu

//    let pageListener: MoviesMenuListPageListener
//    var headerView: AnyView?

//    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
//        return Props(movies: state.moviesState.moviesList[menu] ?? [])
//    }
//
    func body(props: Props) -> some View {
        MoviesList(movies: props.products,
                   pageListener: pageListener,
                   headerView: headerView)
            .navigationBarTitle(menu.title())
    }
}
