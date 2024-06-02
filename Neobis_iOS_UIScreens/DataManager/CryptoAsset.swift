//
//  CryptoAsset.swift
//  Neobis_iOS_UIScreens
//
//  Created by Ai Hawok on 02/06/2024.
//

import Foundation

struct CryptoAsset {
    var name: String
    var image: String
    var background: String = "#638FFE"
    
    // Computed property to generate a random price
    var price: String {
        let randomNumber = Int.random(in: 1...1000)
        return "$\(randomNumber)"
    }
    
    // Computed property to generate a random quantity
    var quantity: String {
        let randomNumber = Int.random(in: 1...100)
        let name = (image as NSString).deletingPathExtension
        return "\(randomNumber) \(name)"
    }
    
    // Computed property to generate a random percentage
    var percentage: String {
        let randomNumber = Double.random(in: -1...1)
        return String(format: "%+.2f%%", randomNumber * 100)
    }
}
