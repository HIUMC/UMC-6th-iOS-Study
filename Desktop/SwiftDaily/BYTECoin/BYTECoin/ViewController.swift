//
//  ViewController.swift
//  BYTECoin
//
//  Created by 이수현 on 7/1/24.
//

import UIKit

let apiKey = "18747ECE-3B0C-4195-8617-FAA27BDCB315"

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = pickerData[row]
        bitcoinLabel.text = selectedCurrency // 선택된 행의 값을 UILabel에 표시
        fetchApi(currency: selectedCurrency) // 선택된 통화로 API 호출
    }
    
    let bytecoinLabel = UILabel()
    let bitcoinLabel = UILabel()
    let currencyLabel = UILabel()
    let currencyPicker = UIPickerView()
    let pickerData = ["USD", "GBP", "EUR", "KRW", "CAD", "JPY", "CHF", "CNY"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        bytecoinLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bytecoinLabel)
        bytecoinLabel.text = "ByteCoin"
        bytecoinLabel.textAlignment = .center
        bytecoinLabel.textColor = .black
        bytecoinLabel.font = UIFont.systemFont(ofSize: 35)
        NSLayoutConstraint.activate([
            bytecoinLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bytecoinLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 65)
        ])
        
        bitcoinLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bitcoinLabel)
        bitcoinLabel.text = "USD"
        bitcoinLabel.textAlignment = .center
        bitcoinLabel.textColor = .black
        bitcoinLabel.font = UIFont.systemFont(ofSize: 20)
        NSLayoutConstraint.activate([
            bitcoinLabel.leadingAnchor.constraint(equalTo: bytecoinLabel.trailingAnchor),
            bitcoinLabel.topAnchor.constraint(equalTo: bytecoinLabel.bottomAnchor, constant: 40)
        ])
        
        currencyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(currencyLabel)
        currencyLabel.text = "??"
        currencyLabel.textAlignment = .center
        currencyLabel.textColor = .black
        currencyLabel.font = UIFont.systemFont(ofSize: 20)
        NSLayoutConstraint.activate([
            currencyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currencyLabel.topAnchor.constraint(equalTo: bytecoinLabel.bottomAnchor, constant: 40)
        ])
        
        currencyPicker.translatesAutoresizingMaskIntoConstraints = false
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        view.addSubview(currencyPicker)
        
        NSLayoutConstraint.activate([
            currencyPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            currencyPicker.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        ])
        bitcoinLabel.text = pickerData[currencyPicker.selectedRow(inComponent: 0)]
        fetchApi(currency: pickerData[0])
    }
    func fetchApi(currency: String) {
        let urlString = "https://rest.coinapi.io/v1/exchangerate/BTC/\(currency)/?apikey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // 오류 처리
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            // 응답 데이터 확인
            guard let data = data else {
                print("No data received")
                return
            }
            
            // JSON 디코딩
            do {
                let api = try JSONDecoder().decode(API.self, from: data)
                // 메인 스레드에서 UI 업데이트
                DispatchQueue.main.async {
                    self.handlePosts(api)
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
    func handlePosts(_ api: API) {
        currencyLabel.text = String(format: "%.2f", api.rate)
    }
    
    
}

