//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Sergey on 25.02.2023.
//

import Foundation

struct CoinModel {
    
    let time: String
    let asset_id_base: String
    let rate: Float
    
    var currencyRateString: String {
        return String(format: "%.2f", rate)
    }
    
}
