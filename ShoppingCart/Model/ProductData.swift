//
//  ProductData.swift
//  ShoppingCart
//
//  Created by Miriam Moe on 23/10/2022.
//

//Her skal JSON håndteres

import Foundation


//Lage struct for alle "var" du har i ProductData
struct ProductData: Decodable {
    var product: [Products]
    var quantity: String
    var availability: Availabilities
    var display_price_total: String
    var discounted_display_price_total: String
    
}

struct Quantity: Decodable {
    var quantity: String
}
    
struct Availabilities: Decodable {
        var code: String
        var description: String
        var is_available: Bool
        var description_short: String
    }
    

    
struct Products: Decodable {
        var id: String
        var name: String
        var brand: String?
        var images: ImageURLs
        var brand_id: Int?
        var discount: Discount
        var front_url: String
        var full_name: String
        var promotion: String?
        var name_extra: String
        var gross_price: String
        var availability: Availability
        var gross_unit_price: String
        var client_classifiers: String
        var unit_price_quantity_name: String
        var unit_price_quantity_abbreviation: String
}

struct ImageURLs: Decodable {
    var large: String
    var thumbnail: Thumbnail
}

struct Thumbnail: Decodable {
    var url: String
}


struct Discount: Decodable {
    var is_discounted: Bool
    var description_short: String
    var undiscounted_gross_price: String
    var undiscounted_gross_unit_price: String
}

struct Promotion: Decodable {
    var title: String
    var text_color: String
    var title_color: String
    var background_color: String
    var description_short: String
    var accessibility_text: String
}

struct Availability: Decodable {
    var code: String
    var description: String
    var is_available: Bool
    var description_short: String
}


struct ClientClassifier: Decodable {
    var name: String
    var image_url: String
    var is_important: Bool
}
