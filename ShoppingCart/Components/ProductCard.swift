//
//  ProductCard.swift
//  ShoppingCart
//
//  Created by Miriam Moe on 23/10/2022.
//

import SwiftUI

// Bytte fra Zstack til Hstack lage rader som går nedover isf ruter
// Legge til SOLGT merke i hjørnet

struct ProductCard: View {
    
    @EnvironmentObject var cartManager: CartManager
    var product: Products
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string: product.images.thumbnail.url)) { newSize in
                    newSize
                        
                        //.resziable
                        .cornerRadius(20)
                        .frame(width: 180)
                        .scaledToFit()
                }    placeholder: {
                    //Oda sin logo
                    Color.brown
                }
                    
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                    
                    Text("\(product.gross_price)kr")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            }
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            
            Button {
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.orange)
                    .cornerRadius(50)
                    .padding()
            }
        }
    }
}

/*
struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: <#T##Products#>)
            .environmentObject(CartManager())
    }
}
*/
