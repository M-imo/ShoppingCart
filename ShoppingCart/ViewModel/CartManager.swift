//
//  CartManager.swift
//  ShoppingCart
//
//  Created by Miriam Moe on 23/10/2022.
//

import Foundation


class CartManager: ObservableObject {
    @Published private(set) var products: [Products]? = []
    @Published private(set) var total: Double = 0.0
    
   private let dataService = DataService()
    
    
   
  
    init() {
        fetchFromAPI()
        //legg dummy data her 
    }
    
    
    
    // Funksjon til å legge til produkt
    func addToCart(product: Products) {
        products = products?.filter { $0.id != product.id }
        total += Double(product.gross_price) ?? 0.0
    }
    
    // Funksjon til å fjerne produkt
    func removeFromCart(product: Products) {
        products = products?.filter { $0.id != product.id }
        total -= Double(product.gross_price) ?? 0.0
    }
    
    func fetchFromAPI() {
        Task {
          do {
              products = try await dataService.fetchFromAPI()
          } catch {
            print("MKMLKMLKMLKMLKMLKM")
            print(error)
            products = nil
          }
        }
      }
    
}
