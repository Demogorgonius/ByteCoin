//
//  CoinData.swift
//  ByteCoin
//
//  Created by Sergey on 25.02.2023.
//

import Foundation

struct CoinData: Codable {
    let time: String
    let asset_id_base: String
    let rate: Float
}
