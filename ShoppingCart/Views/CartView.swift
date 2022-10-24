//
//  CartView.swift
//  ShoppingCart
//
//  Created by Miriam Moe on 23/10/2022.
//

import SwiftUI

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        ScrollView {
            Text("Shopping Cart")
                .bold()
            
            Spacer()
            
            
            
            
            
            if let productItem = cartManager.products {
                if cartManager.products?.count ?? 0 > 0 {
                    ForEach(productItem, id: \.id) { product in
                        ProductRow(product: product)
                        
                    }
                }
                
                HStack {
                    Text("Total sum")
                    Spacer()
                    Text("kr \(cartManager.total).00")
                        .bold()
                }
                .padding()
                
                
            } else {
                Text("Handlekurven er tom.")
            }
        }
    }
    
    /* .navigationTitle(Text("Min handlekurv"))
     .padding(.top) */
    
}




struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}

