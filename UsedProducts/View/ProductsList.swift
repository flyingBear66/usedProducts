//
//  ProductsList.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 29/11/2020.
//

import SwiftUI
import SwiftUIFlux
import Combine

// MARK: - Movies List
struct ProductsList: ConnectedView {
    
    struct Props { }

    // MARK: - Public var
    let products: [Int]

    // MARK: - Computed Props
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props()
    }

    // MARK: - Computed views
    private func productsRows(props: Props) -> some View {
        ForEach(products, id: \.self) { id in

            NavigationLink(destination: ProductDetail(productId: id)) {
                ProductRow(productId: id)
            }
        }
    }

    private func productSection(props: Props) -> some View {
        Group {
            Section {
                productsRows(props: props)
            }
        }
    }

    // MARK: - Body
    func body(props: Props) -> some View {
        List {
            productSection(props: props)
        }
        .listStyle(PlainListStyle())
        .animation(.spring())
        .onAppear {
            loadProducts()
        }
    }

    // MARK: - Action
    private func loadProducts() {
        store.dispatch(action: ProductsActions.FetchProducts())
    }
}

//#if DEBUG
//struct MoviesList_Previews : PreviewProvider {
//    static var previews: some View {
//        MoviesList(movies: [sampleMovie.id]).environmentObject(sampleStore)
//    }
//}
//#endif
