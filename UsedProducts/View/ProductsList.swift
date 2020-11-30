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
    struct Props {

    }

    // MARK: - binding

    // MARK: - Public var
    let products: [Int]
    var headerView: AnyView?

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
            movieSection(props: props)

            /// The pagination is done by appending a invisible rectancle at the bottom of the list, and trigerining the next page load as it appear.
            /// Hacky way for now, hope it'll be possible to find a better solution in a future version of SwiftUI.
            /// Could be possible to do with GeometryReader.
            if !movies.isEmpty {
                Rectangle()
                    .foregroundColor(.clear)
                    .onAppear {
                        if self.pageListener != nil && !self.movies.isEmpty {
                            self.pageListener?.currentPage += 1
                        }
                    }
            }
        }
        .listStyle(PlainListStyle())
        .animation(.spring())
    }
}

#if DEBUG
struct MoviesList_Previews : PreviewProvider {
    static var previews: some View {
        MoviesList(movies: [sampleMovie.id]).environmentObject(sampleStore)
    }
}
#endif
