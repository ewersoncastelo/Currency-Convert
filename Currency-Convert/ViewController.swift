//
//  ViewController.swift
//  Currency-Convert
//
//  Created by ewerson castelo on 24/10/20.
//  Copyright © 2020 ewerson castelo. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let currencyOne : UILabel = {
        let label = UILabel()
        label.text = "CAD:"
        label.textColor = UIColor(red: 254.0 / 255.0, green: 223.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let currencyTwo : UILabel = {
        let label = UILabel()
        label.text = "CHF:"
        label.textColor = UIColor(red: 254.0 / 255.0, green: 223.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let currencyThree : UILabel = {
        let label = UILabel()
        label.text = "GBP:"
        label.textColor = UIColor(red: 254.0 / 255.0, green: 223.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let currencyFour : UILabel = {
        let label = UILabel()
        label.text = "JPY:"
        label.textColor = UIColor(red: 254.0 / 255.0, green: 223.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let currencyFive : UILabel = {
        let label = UILabel()
        label.text = "USD:"
        label.textColor = UIColor(red: 254.0 / 255.0, green: 223.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Currency Convert"
        label.font = label.font.withSize(28)
        label.textColor = UIColor(red: 254.0 / 255.0, green: 223.0 / 255.0, blue: 177.0 / 255.0, alpha: 1.0)
        return label
    }()
    
    let getValuesButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Rates", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.frame.size = CGSize(width: 50.0, height: 50.0)
        button.titleLabel?.font = UIFont(name: "Get Rates", size: 40)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleGetApi), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        
        setupUI()
    }
    
    // MARK:- Functions
    @objc func handleGetApi(){
        print("Trying get api value...")
        
        // 1
        let urlString = "http://data.fixer.io/api/latest?access_key=6437aa51e602470d12ee17f4bce567c3"
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        
        // 2
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let okButtom = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okButtom)
                self.present(alert, animated: true, completion: nil)
            } else {
                guard let dataOption = data else { return }
                if data != nil {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: dataOption, options: .mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String: Any]{
                                guard let cad = rates["CAD"] else { return }
                                self.currencyOne.text = "CAD: \(cad)"
                                
                                if let chf = rates["CHF"] as? Double {
                                    self.currencyTwo.text = "CHF: \(chf)"
                                }
                                
                                if let gbp = rates["GBP"] as? Double {
                                    self.currencyThree.text = "GBP: \(gbp)"
                                }
                                
                                if let jpy = rates["JPY"] as? Double {
                                    self.currencyFour.text = "PJY: \(jpy)"
                                }
                                
                                if let usd = rates["USD"] as? Double {
                                    self.currencyFive.text = "USD: \(usd)"
                                }
                            }
                        }
                        
                    } catch {
                        print("Some error in thejg")
                    }
                }
            }
        }
        
        task.resume()
        
    }
    
    // MARK:- Setup Layout
    func setupUI() {

        let stack = UIStackView(arrangedSubviews: [currencyOne, currencyTwo, currencyThree, currencyFour, currencyFive])
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 0
        
        view.addSubviews(titleLabel, stack, getValuesButton)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.topMargin).inset(30)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(50)
        }
        
        stack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottomMargin).inset(-50)
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(getValuesButton.snp.topMargin).inset(-50)
        }
        
        getValuesButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottomMargin)
            make.centerX.equalTo(view.snp.centerX)
        }
    }

}

extension UIView {
    func addSubviews(_ views: UIView...){
        views.forEach({addSubview($0)})
    }
}

