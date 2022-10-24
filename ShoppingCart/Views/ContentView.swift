//
//  ContentView.swift
//  ShoppingCart
//
//  Created by Miriam Moe on 23/10/2022.
//

import SwiftUI

// TODO Lage DarkMode, endre til rows isf columns, legge til name_extra, discount, outOfStock parse JSON


struct ContentView: View {
   
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    if let i = cartManager.products {
                        ForEach(i, id: \.id) { products in
                            ProductCard(product: products)
                                .environmentObject(cartManager)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Shopping"))
            .toolbar {
                NavigationLink { //Henviser til handlekurvsiden altså til CartView()
                    CartView()
                        .environmentObject(cartManager)
                } label: {
                    CartButton(numberOfProducts: cartManager.products?.count ?? 0)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
  
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
