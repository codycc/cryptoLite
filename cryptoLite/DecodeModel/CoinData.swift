//
//  Coin.swift
//  cryptoLite
//
//  Created by Cody Condon on 2020-11-24.
//

import Foundation

struct CoinData: Codable {
    let name: String
    let symbol: String
    let quote: USD
}

struct USD: Codable {
    let USD: Price
}

struct Price: Codable {
    let price: Double
}
