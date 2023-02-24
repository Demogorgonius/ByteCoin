//
//  UIProperty.swift
//  ByteCoin
//
//  Created by Sergey on 24.02.2023.
//

import Foundation
import UIKit


struct LabelProperty {
    let titleLabelFrame = CGRect(x: 0, y: 0, width: 230, height: 60)
    let titleLabelFont = UIFont.systemFont(ofSize: 50, weight: .thin)
    let titleLabelColor = UIColor(named: "Title Color")
    
    let currencyLabelFrame = CGRect(x: 0, y: 0, width: 50.5, height: 30)
    let currencyLabelFont = UIFont.systemFont(ofSize: 25, weight: .regular)
    let currencyLabelColor = UIColor.white
    
    let rateLabelFrame = CGRect(x: 0, y: 0, width: 213.5, height: 30)
    let rateLabelFont = UIFont.systemFont(ofSize: 25, weight: .regular)
    let rateLabelColor = UIColor.white
}



