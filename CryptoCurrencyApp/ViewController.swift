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
    var cryptoCurrencies = [Crypto]()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
        navigationItem.title = "Cryptocurrency"
//        navigationItem.titleView?.tintColor = UIColor.white //check this
        
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
                self.cryptoCurrencies = try JSONDecoder().decode([Crypto].self, from: data)
//                print(self.cryptoCurrencies[0])
//                print(String(self.cryptoCurrencies.count))
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let jsonErr{
                print("Error serializing JSON:", jsonErr)
            }
        }.resume()
        
        /*Button to go to user profile page*/
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Profile", style: .plain, target: self, action: #selector(buttonAction))
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let controller = ProfileController()
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
        return cryptoCurrencies.count
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
//        doSomethingWithItem(indexPath.row)
        print(indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .value1, reuseIdentifier: cellId)
        }
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.init(red: 8.0/255, green: 18.0/255, blue: 40.0/255, alpha: 1)
        
        let priceOfCrypto = Double(cryptoCurrencies[indexPath.row].price_usd)
        
        //formating the cells
        if let this_cell = cell {
            this_cell.detailTextLabel?.text = "$" + String(format:"%.2f",priceOfCrypto!)
            this_cell.detailTextLabel?.textColor = UIColor.white
            this_cell.textLabel?.text = cryptoCurrencies[indexPath.row].name
            this_cell.textLabel?.textColor = UIColor.init(red: 189.0/255, green: 199.0/255, blue: 193.0/55, alpha: 1.0)
            this_cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
            this_cell.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
            this_cell.layer.borderWidth = 0.3
            this_cell.layer.borderColor = UIColor.black.cgColor
            this_cell.selectedBackgroundView = bgColorView
            
            this_cell.accessoryType = .detailDisclosureButton

        }
        
        
        
//        if(indexPath.row % 2 == 0)
//        {
//            cell!.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
//        }
//        else
//        {
//            cell!.backgroundColor = UIColor.init(red: 20.0/255, green: 30.0/255, blue: 52.0/255, alpha: 1)
//        }
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = MoreDataController()
        controller.setCryptoData(cryptoDataReference: cryptoCurrencies[indexPath.row])
        navigationController?.pushViewController(controller, animated: true)
    }

}


