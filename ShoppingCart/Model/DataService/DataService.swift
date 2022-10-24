//
//  DataService.swift
//  ShoppingCart
//
//  Created by Miriam Moe on 23/10/2022.
//

// Her håndteres URL (ikke ferdig)

import Foundation

enum NetworkError: Error {
    case misformatUrl
    case dataLoadFailed
}



struct DataService {
    
    private static let url = "http://api.npoint.io/d4e0a014b1cfc5254bcb"
    
    func performRequest(_ input: String ) async throws -> [Products] {
        if let url = URL(string: input) {
            let request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            let bearbeidetData = try JSONDecoder().decode(ProductData.self, from: data)
            
            
            let newBearbeidetData = bearbeidetData.product
            
            return newBearbeidetData
        }
        throw NetworkError.misformatUrl
        
        
    }
    
    func fetchFromAPI() async throws -> [Products] {
        let urlString = DataService.url
        return try await performRequest(urlString)
    }
}


//throw NetworkError.dataLoadFailed





/*Task {
 let x = try await performRequest("https://api.npoint.io/d4e0a014b1cfc5254bcb")
 
 } */

