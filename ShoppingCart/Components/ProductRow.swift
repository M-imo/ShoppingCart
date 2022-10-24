//
//  ProductRow.swift
//  ShoppingCart
//
//  Created by Miriam Moe on 23/10/2022.
//

import SwiftUI

struct ProductRow: View {
    
    @EnvironmentObject var cartManager: CartManager
    var product: Products
    
    
    var body: some View {
        
        
        
        HStack(spacing: 20) {
            AsyncImage(url: URL(string: product.images.thumbnail.url )) { newSize in
                newSize
                    .image?
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold()
                
                Text("kr \(product.gross_price)")
            }
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                .onTapGesture { // tilpasset rød fargen
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

/*
 struct ProductRow_Previews: PreviewProvider {
 static var previews: some View {
 ProductRow(product: productList[2])
 .environmentObject(CartManager())
 }
 }
 */

