//
//  ProductDetail.swift
//  UsedProducts
//
//  Created by Ozgun Zor on 29/11/2020.
//

import SwiftUI
import SwiftUIFlux
import Combine
import SDWebImageSwiftUI

struct ProductDetail: ConnectedView {
    struct Props {
        let product: Product
    }

    let productId: Int

    // MARK: Computed Props
    func map(state: AppState, dispatch: @escaping DispatchFunction) -> Props {
        return Props(product: state.productsState.products[productId])
    }
    
    // MARK: - Fetch
    func fetchProductDetails() {
        store.dispatch(action: ProductsActions.FetchProductDetail(productId: productId))
    }
    
    // MARK: - Body
    
    func body(props: Props) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            WebImage(url: props.product.imageURL)
                .resizable()
                .placeholder {
                    Rectangle().foregroundColor(.gray)
                }
                .frame(height: 300, alignment: .center)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Product Detail for \(props.product.title)")
                    .font(.subheadline)
                    .foregroundColor(.primary)
                
                Text("Placeholder for \(props.product.title)")
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            
            Spacer()
        }
        .padding()
        .onAppear {
            self.fetchProductDetails()
        }
    }
}

private extension Product {
    var imageURL: URL? {
        URL(string: image)
    }
}
