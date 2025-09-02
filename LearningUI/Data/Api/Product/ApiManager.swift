//
//  ApiManager.swift
//  LearningUI
//
//  Created by Prabhu Devar on 02/09/25.
//

import Foundation

enum NetworkError:Error{
    case invalidURL
   case invalideResponse
}

// final to avoide the inheritance
final class ApiManager{
    // api request using the generic type
    func fetchProdectList<T:Decodable>(url:String) async throws ->T {
        
        guard let url = URL(string: url) else
        {
          throw NetworkError.invalidURL
        }
        
        let (data,response) =  try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else{
            throw NetworkError.invalideResponse
        }
        
        return try JSONDecoder().decode(T.self, from: data)
        
    }
}
