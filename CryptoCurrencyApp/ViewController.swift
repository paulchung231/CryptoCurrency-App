//
//  ViewController.swift
//  TestApp
//
//  Created by Paul Chung on 1/23/18.
//  Copyright © 2018 Paul Chung. All rights reserved.
//

import UIKit


struct Crypto: Decodable{
    
    let id: String
    let name: String
    let symbol: String
    let rank: String
    let price_usd: String
    let price_btc: String
    //        let 24h_volume_usd: String
    let market_cap_usd: String
    let available_supply: String
    let total_supply: String
    let max_supply: String?
    let percent_change_1h: String
    let percent_change_24h: String
    let percent_change_7d: String
    let last_updated: String
    
}

protocol CryptoCellDelegate {
    func didTapAddCrypto(name: String)
}

class ViewController: UITableViewController {
    
    let numberOfCellsOnTable = 10
    let cellId = "cellId"
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        if let viewControllers = self.navigationController?.viewControllers {
            let previousVC: UIViewController? = viewControllers.count >= 2 ? viewControllers[viewControllers.count - 2] : nil; // get previous view
            previousVC?.title = "Sign out" // or previousVC?.title = "Back"
        }
        view.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)//took out to include a custom detail label
        
//        if #available(iOS 11.0, *) {
//            navigationController?.navigationBar.prefersLargeTitles = true
//        } else {
//            // Fallback on earlier versions
//        }
        
        //API and URL fetching below when loading the app
        let jsonUrlString = "https://api.coinmarketcap.com/v1/ticker/?limit=100"
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url){
            (data, response, err) in
            guard let data = data else { return }
            do{
                global.cryptoCurrencies = try JSONDecoder().decode([Crypto].self, from: data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let jsonErr{
                print("Error serializing JSON:", jsonErr)
            }
        }.resume()

        /*Comment back in if want to use custom CryptoCell class*/
//        tableView.register(CryptoCell.self, forCellReuseIdentifier: CryptoCell.identifier)
//        tableView.reloadData()
        
        /*Button to go to user profile page*/
        print(global.savedCryptos)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(buttonAction))
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let controller = ProfileController()
        global.savedCryptos.append(global.cryptoCurrencies[0])
        navigationController?.pushViewController(controller, animated: true)
        print("Profile tapped")
    }
    
//    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let label = UILabel()
//        label.text = "By rank"
////        label.textColor = UIColor.init(red: 189.0/255, green: 199.0/255, blue: 193.0/55, alpha: 1.0) //fix later
////        label.font = UIFont(name: "Avenir-Light", size: 25)
//        return label
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return global.cryptoCurrencies.count
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        /*To use the Crypto Custom cell, needs additional work*/
//        let this_cell = tableView.dequeueReusableCell(withIdentifier: CryptoCell.identifier, for: indexPath) as! CryptoCell
//        let priceOfCrypto = Double(cryptoCurrencies[indexPath.row].price_usd)
//        this_cell.pass_this_crypto(crypto: cryptoCurrencies[indexPath.row])
//        this_cell.label_price.text = "$" + String(format:"%.2f",priceOfCrypto!)
//        this_cell.label_name.text = cryptoCurrencies[indexPath.row].name
//        this_cell.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
//        let bgColorView = UIView()
//        bgColorView.backgroundColor = UIColor.init(red: 8.0/255, green: 18.0/255, blue: 40.0/255, alpha: 1)
//        this_cell.selectedBackgroundView = bgColorView
//        return this_cell
        

//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellId)
        }

        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.init(red: 8.0/255, green: 18.0/255, blue: 40.0/255, alpha: 1)

        let priceOfCrypto = Double(global.cryptoCurrencies[indexPath.row].price_usd)
        let percent_change = Double(global.cryptoCurrencies[indexPath.row].percent_change_24h)
        //formating the cells
        let pad_num = 8 - (global.cryptoCurrencies[indexPath.row].price_usd).count
        if let this_cell = cell {
            let percent_change_24hr = ((global.cryptoCurrencies[indexPath.row].percent_change_24h) + "%").padding(toLength: (14 + pad_num), withPad: " ", startingAt: 0) + "$" + String(format:"%.2f",priceOfCrypto!)
            
            this_cell.detailTextLabel?.text = percent_change_24hr
            if percent_change! >= 0.0 { this_cell.detailTextLabel?.textColor = UIColor(red: 0/255, green: 229/255, blue: 95/255, alpha: 1.0) } else { this_cell.detailTextLabel?.textColor = UIColor(red: 219/255, green: 0/255, blue: 47/255, alpha: 1.0) }
            this_cell.detailTextLabel?.alpha = 0.7
            this_cell.detailTextLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
//            let padded_text = (global.cryptoCurrencies[indexPath.row].rank).padding(toLength: 8, withPad: " ", startingAt: 0) + ("(" + global.cryptoCurrencies[indexPath.row].symbol + ") ") + global.cryptoCurrencies[indexPath.row].name
            this_cell.textLabel?.text = (global.cryptoCurrencies[indexPath.row].rank).padding(toLength: 8, withPad: " ", startingAt: 0) + global.cryptoCurrencies[indexPath.row].name
            this_cell.textLabel?.textColor = UIColor.init(red: 189.0/255, green: 199.0/255, blue: 193.0/55, alpha: 1.0)
            this_cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            this_cell.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
            this_cell.layer.borderWidth = 0.3
            this_cell.layer.borderColor = UIColor.black.cgColor
            this_cell.selectedBackgroundView = bgColorView

        }
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = MoreDataController()
        controller.setCryptoData(cryptoDataReference: global.cryptoCurrencies[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Coins"
    }
    
}
//var mainInstance = ViewController()


