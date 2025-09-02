//
//  ProductRowCell.swift
//  LearningUI
//
//  Created by Prabhu Devar on 02/09/25.
//

import SwiftUI

struct ProductRowCell: View {
    
    let Product: Product
    var body: some View {
        HStack(spacing:15){
            if let url = URL(string:  Product.image){
                AsyncImage(url: url) { image in
                    image.resizable()
                        .scaledToFit()
                    
                } placeholder: {
                ProgressView()
                }
                .frame(width: 100,height: 100)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            }
            VStack(alignment:.leading,spacing: 8){
                Text(Product.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(2)
                
                HStack{
                    Text(Product.category)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                    Spacer()
                    HStack{
                        Image(systemName: "star.fill")
                        Text("\(Product.rating.rate.oneDecimalPlace)")
                    }
                    .foregroundStyle(.yellow)
                    .font(.headline)

                }
                Text(Product.description)
                    .font(.footnote)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                    .lineLimit(3)
                
                HStack{
                    Text("₹\(Product.price.oneDecimalPlace)")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Buy")
                            .padding(.horizontal)
                            .padding(.vertical,5)
                            .background(.indigo)
                            .clipShape(.capsule)
                            .foregroundStyle(.white)
                          
                    }

                    
                }
            }
        }
        .padding()
    }
}

#Preview {
    ProductRowCell(Product: Product.dummy)
}
