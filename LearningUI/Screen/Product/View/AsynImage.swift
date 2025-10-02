//
//  AsynImage.swift
//  LearningUI
//
//  Created by Prabhu Devar on 03/09/25.
//

import SwiftUI

struct AsynImage: View {
    
    let imageUrl:String
    var body: some View {
        if let url = URL(string: imageUrl) {
            AsyncImage(url: url) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }

        }else{
            ProgressView()
        }
    }
}

#Preview {
    AsynImage(imageUrl: Product.dummy.image)
}
