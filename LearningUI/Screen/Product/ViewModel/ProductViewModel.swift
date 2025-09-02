//
//  ProductViewModel.swift
//  LearningUI
//
//  Created by Prabhu Devar on 02/09/25.
//

import Foundation


@Observable class ProductViewModel {
    
    var product: [Product] = [] // empty array
    
    let manager = ApiManager()
    
    
    func fetchProducts()  async{
        
        do{
            product = try await manager.fetchProdectList(url: Constant.Api.productListRrl)
        
        }catch{
            print("Featch product Error",error)
        }
    }
    
    
}
