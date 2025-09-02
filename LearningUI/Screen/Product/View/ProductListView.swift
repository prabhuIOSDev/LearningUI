//
//  ProductListView.swift
//  LearningUI
//
//  Created by Prabhu Devar on 02/09/25.
//

import SwiftUI

struct ProductListView: View {
    let viewModel = ProductViewModel()
    
    var body: some View {
        NavigationStack{
            List(viewModel.product){ product in
                ProductRowCell(Product: product)
                
                    .listRowSeparator(.automatic)
            
                
            }
            .listStyle(.plain)
            .navigationTitle( "Product List")
                
        }
        .task {
        await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductListView()
}
