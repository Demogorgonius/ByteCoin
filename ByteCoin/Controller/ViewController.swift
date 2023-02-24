//
//  ViewController.swift
//  ByteCoin
//
//  Created by Sergey on 24.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

//MARK: - Variables

    var labels = LabelProperty()
    
//MARK: - UIViews/UIStackViews
    
    lazy var backgroundImage: UIView = {
        let image = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        image.backgroundColor = UIColor(named: "Background Color")
        return image
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stack = UIStackView(frame: CGRect(x: 0, y: 0, width: 414, height: 165))
        stack.axis = .vertical
        stack.spacing = 25.0
        stack.alignment = .center
        stack.contentMode = .scaleToFill
        stack.distribution = .fill
        [].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView(frame: CGRect(x: 0, y: 0, width: 364, height: 80))
        stack.axis = .horizontal
        stack.spacing = 10.0
        stack.alignment = .center
        stack.contentMode = .scaleToFill
        stack.distribution = .fill
        [].forEach {
            stack.addArrangedSubview($0)
        }
        return stack
    }()
    
    lazy var bitcoinImage: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        image.image = UIImage(systemName: "bitcoinsign.circle.fill")
        return image
    }()
    
//MARK: - UIButtons
    
//MARK: - UILabels
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: labels.titleLabelFrame)
        label.text = "ByteCoin"
        label.font = labels.titleLabelFont
        label.textColor = labels.titleLabelColor
        label.textAlignment = .center
        return label
    }()
    
    lazy var currencyLabel: UILabel = {
        let label = UILabel(frame: labels.currencyLabelFrame)
        label.text = "USD"
        label.font = labels.currencyLabelFont
        label.textColor = labels.currencyLabelColor
        label.textAlignment = .center
        return label
    }()
    
    lazy var currencyRateLabel: UILabel = {
        let label = UILabel(frame: labels.rateLabelFrame)
        label.text = "..."
        label.font = labels.rateLabelFont
        label.textColor = labels.rateLabelColor
        label.textAlignment = .right
        return label
    }()
    
//MARK: - Other UI Elements
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 414, height: 216))
        picker.contentMode = .scaleToFill
        return picker
    }()
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//MARK: - Setup constrains
    
//MARK: - Methods
    

}

//MARK: - Extensions UIPickerView

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
    
    
}

//MARK: - Extension ViewController CoinManagerDelegate


