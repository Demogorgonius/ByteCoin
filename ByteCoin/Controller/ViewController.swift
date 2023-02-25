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
    var coinManager = CoinManager()
    
//MARK: - UIViews/UIStackViews
    
    lazy var backgroundImage: UIView = {
        let image = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 896))
        image.backgroundColor = UIColor(named: "Background Color")
        return image
    }()
    
    lazy var coinView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 374, height: 80))
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.2470588235)
        view.addSubview(horizontalStackView)
        return view
    }()
    
    lazy var verticalStackView: UIStackView = {
        let stack = UIStackView(frame: CGRect(x: 0, y: 0, width: 414, height: 165))
        stack.axis = .vertical
        stack.spacing = 25.0
        stack.alignment = .center
        stack.contentMode = .scaleToFill
        stack.distribution = .fill
        [titleLabel,
        coinView].forEach {
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
        [bitcoinImage,
        currencyRateLabel,
        currencyLabel].forEach {
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
    
    lazy var pickerCurrencyView: UIPickerView = {
        let picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 414, height: 216))
        picker.contentMode = .scaleToFill
        return picker
    }()
    
//MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerCurrencyView.delegate = self
        coinManager.delegate = self
        view.addSubview(backgroundImage)
        view.addSubview(verticalStackView)
        view.addSubview(pickerCurrencyView)
        
        setupConstraints()
        
        
    }
    
//MARK: - Setup constrains
    
    func setupConstraints() {
        pickerCurrencyView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.equalTo(216)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(165)
        }
        
        coinView.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.bottom.equalTo(verticalStackView)
            make.trailing.equalTo(verticalStackView).offset(-10)
        }
        
        bitcoinImage.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(80)
            
        }
        
    }
    
//MARK: - Methods
    

}

//MARK: - Extensions UIPickerView

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return coinManager.currencyArray.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return coinManager.currencyArray[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        currencyLabel.text = coinManager.currencyArray[row]
        coinManager.fetchRest(currency: coinManager.currencyArray[row])
        
    }
    
    
}

//MARK: - Extension ViewController CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    func updateCoin(_ coinManager: CoinManager, coin: CoinModel) {
        
        currencyRateLabel.text = coin.currencyRateString
        
    }
    
    func failure(error: Error) {
        
        let alert = UIAlertController(title: "Ошибка", message: error.localizedDescription, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default) { alertAction in
            return
        }
        
        alert.addAction(cancelAction)
        present(alert, animated: true)
        
    }
    
    
}
