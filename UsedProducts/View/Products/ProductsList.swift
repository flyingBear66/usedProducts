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

    enum Mode {
        case list, grid
    }

    struct Props { }

    // MARK: - Private vars
    private let vSpacing: CGFloat = 8
    private let hSpacing: CGFloat = 8
    private let vPadding: CGFloat = 8
    private let hPadding: CGFloat = 15

    // MARK: - Public var
    let products: [Product]

    var productIds: [Int] {
        products.map { $0.id }
    }

    var homeMode: Mode = .grid

    // MARK: - Computed Props
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props()
    }

    // MARK: - List view pieces
    private func productsRows(props: Props) -> some View {
        ForEach(productIds, id: \.self) { id in
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

    private func listBody(props: Props) -> some View {
        List {
            productSection(props: props)
        }
        .listStyle(PlainListStyle())
        .animation(.spring())
        .onAppear {
            loadProducts()
        }
    }

    // MARK: - List view pieces

    private func gridBody(props: Props) -> some View {
        GeometryReader { geometry in
            Group {
                if !self.products.isEmpty {
                    ScrollView {
                        self.content(using: geometry)
                    }
                }
            }
            .padding(.horizontal, self.hPadding)
            .padding(.vertical, self.vPadding)
        }
        .onAppear {
            loadProducts()
        }
    }

    // MARK: - Body
    func body(props: Props) -> some View {
        gridBody(props: props)
    }

    private var rows: Int {
        products.count / self.cols
    }

    private var cols: Int {
        UIDevice.current.orientation.isLandscape ? 3 : 2
    }

    private func content(using geometry: GeometryProxy) -> some View {
        VStack(spacing: self.vSpacing) {
            Categories()

            HStack {
                Text("Top Products")
                    .font(.headline)
                    .foregroundColor(.black)

                Spacer()

                Button("See All") {
                    print("See all tapped")
                }
                .foregroundColor(.red)
                .font(.caption)
            }

            TopProducts()

            HStack {
                Text("Porto")
                    .font(.headline)
                    .foregroundColor(.black)

                Spacer()

                Button("Edit") {
                    print("Edit Tapped")
                }
                .foregroundColor(.red)
                .font(.caption)
            }

            ForEach((0..<self.rows).map { GridIndex(id: $0) }) { row in
                self.rowAtIndex(row.id * self.cols,
                                geometry: geometry)
            }
            // Handle last row
            if (self.products.count % self.cols > 0) {
                self.rowAtIndex(self.cols * self.rows,
                                geometry: geometry,
                                isLastRow: true)
            }
        }
    }

    private func rowAtIndex(_ index: Int,
                            geometry: GeometryProxy,
                            isLastRow: Bool = false) -> some View {
        HStack(spacing: self.hSpacing) {
            ForEach((0..<(isLastRow ? products.count % cols : cols))
                        .map { GridIndex(id: $0) }) { column in
                NavigationLink(destination: ProductDetail(productId: index + column.id)) {
                    ProductCell(productId: index + column.id, width: self.contentWidthFor(geometry))
                }
                .frame(width: self.contentWidthFor(geometry))
            }
            if isLastRow { Spacer() }
        }
    }

    private func contentWidthFor(_ geometry: GeometryProxy) -> CGFloat {
        let hSpacings = hSpacing * (CGFloat(self.cols) - 1)
        let width = geometry.size.width - hSpacings - hPadding * 2
        return width / CGFloat(self.cols)
    }

    // MARK: - Action
    private func loadProducts() {
        store.dispatch(action: ProductsActions.FetchProducts())
    }

    private struct GridIndex : Identifiable { var id: Int }

}

//#if DEBUG
//struct MoviesList_Previews : PreviewProvider {
//    static var previews: some View {
//        MoviesList(movies: [sampleMovie.id]).environmentObject(sampleStore)
//    }
//}
//#endif
