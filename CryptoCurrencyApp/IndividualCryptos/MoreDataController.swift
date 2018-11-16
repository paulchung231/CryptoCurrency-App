//
//  MoreDataController.swift
//  TestApp
//
//  Created by Paul Chung on 1/31/18.
//  Copyright © 2018 Paul Chung. All rights reserved.
//

import UIKit

class MoreDataController: UIViewController {
    var cryptoDetails:Crypto?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addToPortfolio))
        view.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
        
        navigationItem.title = cryptoDetails?.name
        
        let price_usd_label = UILabel()
        let priceOfCrypto = Double((cryptoDetails?.price_usd)!)
        price_usd_label.font = price_usd_label.font.withSize(20)
        price_usd_label.frame = CGRect(x: view.frame.minX + 50, y: view.frame.minY + 70, width: 300, height: 100)
        price_usd_label.text = "$" + String(format:"%.2f",priceOfCrypto!)
        price_usd_label.textColor = UIColor.init(red: 189.0/255, green: 199.0/255, blue: 193.0/55, alpha: 1.0)
        price_usd_label.textAlignment = .center
        price_usd_label.center.x = self.view.center.x
        
        let lower_pos = CGRect(x:view.frame.minX , y:(view.frame.maxY/2), width: view.frame.maxX, height: (view.frame.maxY/2))
        let bottom_view = UIView(frame: lower_pos)
        bottom_view.backgroundColor = UIColor(red: 20.0/255, green: 30.0/255, blue: 52.0/255, alpha: 1)
//        bottom_view.backgroundColor = UIColor(red: 20/255, green: 48/255, blue: 79/255, alpha: 1.0)
        
        self.view.addSubview(price_usd_label)
        self.view.addSubview(bottom_view)

        if let this_cryptoDetails = cryptoDetails {
            showDetails(this_crypto: this_cryptoDetails)
        }
        else {
            let default_label = UILabel()
            default_label.frame = CGRect(x: 40, y: 100, width: 300, height: 100)
            default_label.textColor = UIColor.white
            default_label.text = "Not available"
        }
    }
    
    @objc func addToPortfolio(sender: UIButton!) {
//        print("maxY:", view.frame.maxY)
//        print("maxX:", view.frame.maxX)
//        print("In moreData: ", savedCryptos)
        let title_alert = (cryptoDetails?.name)! + " was saved"
        let alert = UIAlertController(title: title_alert,
                                      message: "",
                                      preferredStyle: .alert)
        
//        let saveAction = UIAlertAction(title: "Save",
//                                       style: .default) {
//                                        [unowned self] action in
//
//                                        guard let textField = alert.textFields?.first,
//                                            let nameToSave = textField.text else {
//                                                return
//                                        }
        
//        }
        global.savedCryptos.append(self.cryptoDetails!)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel, handler: { (action: UIAlertAction!) in
                                            print("Handle Cancel Logic here")
        })
        
//        alert.addTextField()
    
//        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // get previous view controller and set title to "" or any things You want
        if let viewControllers = self.navigationController?.viewControllers {
            let previousVC: UIViewController? = viewControllers.count >= 2 ? viewControllers[viewControllers.count - 2] : nil; // get previous view
            previousVC?.title = "" // or previousVC?.title = "Back"
        }
    }
    
    func setCryptoData(cryptoDataReference:Crypto){
        cryptoDetails = cryptoDataReference
    }
    
    func showDetails(this_crypto:Crypto){
        let rank_label = CryptoDetailLabels(frame: CGRect(x: (view.frame.maxX/2), y: ((view.frame.maxY/2) + 10), width: 100, height: 20))
        let rank_value = CryptoDetailValues(frame: CGRect(x: (view.frame.maxX/2), y: ((view.frame.maxY/2) + rank_label.frame.size.height + 15), width: view.frame.maxX - 10, height: 20))
//        rank_label.backgroundColor = UIColor.red
        
        let max_supply_label = CryptoDetailLabels(frame: CGRect(x: 10, y: ((view.frame.maxY/2) + 10), width: 100, height: 20))
        let max_supply_value = CryptoDetailValues(frame: CGRect(x: 10, y: ((view.frame.maxY/2) + rank_label.frame.size.height + 15), width: view.frame.maxX - 10, height: 20))
//            CryptoDetailLabels(frame: CGRect(x: 10, y: ((view.frame.maxY/2) + rank_label.frame.size.height + 10), width: view.frame.maxX - 10, height: 20))
//        let id_label =
//        let name_label
//        let symbol_label
//        let price_btc_label = CryptoDetailLabels(frame: CGRect(x: 10, y: ((view.frame.maxY/2) + 20), width: view.frame.maxX - 10, height: 20))
//        let market_cap_usd_label = CryptoDetailLabels(frame: CGRect(x: 10, y: ((view.frame.maxY/2) + 25), width: view.frame.maxX - 10, height: 20))
//        let available_supply_label = CryptoDetailLabels(frame: CGRect(x: 10, y: ((view.frame.maxY/2) + 5), width: view.frame.maxX - 10, height: 20))
        let total_supply_label = CryptoDetailLabels(frame: CGRect(x: 10, y: ((view.frame.maxY/2) + (2 * rank_label.frame.size.height) + 30), width: view.frame.maxX - 10, height: 20))
//        let percent_change_1h_label = CryptoDetailLabels(frame: CGRect(x: 10, y: ((view.frame.maxY/2) + 5), width: view.frame.maxX - 10, height: 20))
//        let percent_change_24h_label = CryptoDetailLabels(frame: CGRect(x: 10, y: ((view.frame.maxY/2) + 5), width: view.frame.maxX - 10, height: 20))
//        let percent_change_7d_label = CryptoDetailLabels(frame: CGRect(x: 10, y: ((view.frame.maxY/2) + 5), width: view.frame.maxX - 10, height: 20))
//        let last_updated_label = CryptoDetailLabels(frame: CGRect(x: 10, y: ((view.frame.maxY/2) + 5), width: view.frame.maxX - 10, height: 20))
//        max_supply_label.backgroundColor = UIColor.red
//        if let this_max_supply = this_crypto.max_supply { max_supply_label.text = "Max supply: " + this_max_supply } else { max_supply_label.text = "Max supply: N/A" }
        rank_label.text = "Rank"
        rank_value.text = "#" + this_crypto.rank
        max_supply_label.text = "Max Supply"
        if let this_max_supply = this_crypto.max_supply { max_supply_value.text = String(format:"%.2f",Double(this_max_supply)!) } else { max_supply_value.text = " " }
        total_supply_label.text = "Total Supply"
        
        self.view.addSubview(rank_label)
        self.view.addSubview(rank_value)
        self.view.addSubview(max_supply_label)
        self.view.addSubview(max_supply_value)
        self.view.addSubview(total_supply_label)
    }
}

