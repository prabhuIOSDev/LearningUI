//
//  ProductDetailsView.swift
//  LearningUI
//
//  Created by Prabhu Devar on 03/09/25.
//

import SwiftUI

struct ProductDetailsView: View {
    let product: Product
    var body: some View {
        VStack(alignment:.center,spacing: 16){
            AsynImage(imageUrl: product.image)
                .frame(height: 400)
                .scaledToFit()
           

            VStack(alignment:.leading,spacing: 15){
                Text(product.title)
                    .font(.headline)
                Text(product.description)
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                
                HStack(spacing:10){
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text(product.rating.rate.oneDecimalPlace)
                    }
                    .font(.caption)
                    .fontWeight(.semibold)
                    Spacer()
                    CircleView()
                    Text("4.6 Reviews")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    Spacer()
                    CircleView()
                    Text("4.6k Ratings")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                    
                
                }
                .padding()
            }
            .padding()
            
            
            
            
            
            Spacer()
            HStack{
                VStack(alignment:.leading){
                    Text("Total Price")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Text("₹\(product.price.oneDecimalPlace)")
                        .font(.headline)
                        .foregroundStyle(.indigo)
                        .fontWeight(.semibold)
                }
                .padding()
                Spacer()
                HStack{
                    Image(systemName: "cart.fill.badge.plus")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height: 30)
                      
                    
                    Text("Buy Now")
                        .frame(width: 100)
                        .font(.headline)
                        .fontWeight(.bold)
                       
                }
                .foregroundStyle(.white)
                .padding(.horizontal,10)
                .padding(.vertical,7)
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(LinearGradient(
                        gradient: Gradient(stops: [
                            Gradient.Stop(color: .indigo, location: 0.3),
                            Gradient.Stop(color: .gray, location: 0.3),
                        
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing))
                )
                .padding()
                .onTapGesture {
                    print("Working")
                }
                
            }
            .frame(maxWidth: .infinity,maxHeight: 100)
            .background(Color.gray.opacity(0.2))
            .overlay(
                AnimatedGradientBorder(cornerRadius: 12, lineWidth: 1)
            )
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
            
            
        }
    }
}

#Preview {
    ProductDetailsView(product: Product.dummy)
}

struct CircleView: View {
    var body: some View {
        Circle()
            .frame(width: 8,height: 8)
            .foregroundStyle(.secondary)
    }
}



