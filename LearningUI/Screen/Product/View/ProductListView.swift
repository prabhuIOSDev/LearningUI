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
                NavigationLink(destination: ProductDetailsView(product: product)){
                    // UI view
                    ProductRowCell(Product: product)
                      
                       
                }
                .buttonStyle(.plain )
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle( "Product List")
            
            .background(.gray.opacity(0.2))
                
        }
        
        .task {
        await viewModel.fetchProducts()
        }
    }
}

#Preview {
    ProductListView()
}
