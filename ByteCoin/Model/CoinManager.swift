//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Sergey on 24.02.2023.
//

import Foundation

protocol CoinManagerDelegate {
    
    func updateCoin(_ coinManager: CoinManager, coin: CoinModel)
    func failure(error: Error)
    
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = CoinApiKey().key
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func fetchRest(currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.failure(error: error!)
                    return
                } else {
                    if let data = data {
                        DispatchQueue.main.async {
                            if let coin = parseJSON(data) {
                                self.delegate?.updateCoin(self, coin: coin)
                            }
                        }
                    }
                }
            }
            
            task.resume()
            
        }
        
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let time = decodedData.time
            let asset_id_base = decodedData.asset_id_base
            let rate = decodedData.rate
            
            let coin = CoinModel(time: time, asset_id_base: asset_id_base, rate: rate)
            return coin
            
        } catch {
            delegate?.failure(error: error)
            return nil
        }
    }
    
    
}
