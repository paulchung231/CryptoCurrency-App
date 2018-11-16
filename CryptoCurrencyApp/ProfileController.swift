//
//  ProfileController.swift
//  TestApp
//
//  Created by Paul Chung on 11/2/18.
//  Copyright © 2018 Paul Chung. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    let cellReuseIdentifier = "cell"
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
        
        let label_name = UILabel()
        label_name.frame = CGRect(x: 40, y: 70, width: 300, height: 100)
        label_name.text = "Profile Name"
        label_name.font = UIFont.boldSystemFont(ofSize: 25)
        label_name.textColor = UIColor.white
        label_name.textAlignment = .center
        label_name.center.x = self.view.center.x
        
        let user_assets = UILabel()
        user_assets.frame = CGRect(x: 40, y: label_name.frame.size.height, width: 300, height: 100)
        user_assets.text = "$"
        user_assets.font = UIFont.boldSystemFont(ofSize: 20)
        user_assets.textColor = UIColor.white
        user_assets.textAlignment = .center
        user_assets.center.x = self.view.center.x
        
        let lower_pos = CGRect(x:view.frame.minX , y:(view.frame.maxY/2), width: view.frame.maxX, height: (view.frame.maxY/2))
        let bottom_view = UIView(frame: lower_pos)

        let saved_coins_table:UITableView = UITableView(frame: CGRect(x:view.frame.minX , y:(view.frame.maxY/2) + 20, width: view.frame.maxX, height: (view.frame.maxY/2)), style: .plain)
        saved_coins_table.separatorStyle = .none
        saved_coins_table.register(SavedCryptosCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        saved_coins_table.dataSource = self
        saved_coins_table.delegate = self
        saved_coins_table.backgroundColor = UIColor(red: 40.0/255, green: 50.0/255, blue: 72.0/255, alpha: 1)

        /*choose one of these colors*/
        bottom_view.backgroundColor = UIColor(red: 10.0/255, green: 20.0/255, blue: 42.0/255, alpha: 1)
//        bottom_view.backgroundColor = UIColor(red: 20/255, green: 48/255, blue: 79/255, alpha: 1.0)
//        print("In Profile: ", savedCryptos)
        for element in global.savedCryptos{
            print(element.name)
        }
        self.view.addSubview(bottom_view)
        self.view.addSubview(label_name)
        self.view.addSubview(user_assets)
        self.view.addSubview(saved_coins_table)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(global.savedCryptos.count)
        return global.savedCryptos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath as IndexPath) as! SavedCryptosCell
        cell.this_crypto = global.savedCryptos[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("User selected table row \(indexPath.row)")
    }
}

class SavedCryptosCell:UITableViewCell{
    var this_crypto:Crypto?
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 40.0/255, green: 50.0/255, blue: 72.0/255, alpha: 1)
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.white.cgColor
        
        guard let name = this_crypto?.name else { return }
        guard let price = this_crypto?.price_usd else { return }
        guard let percent = this_crypto?.percent_change_24h else { return }
        guard let ranking = this_crypto?.rank else { return }
        let priceOfCrypto = Double(price)
        let percent_change = Double(percent)
        //formating the cells
        let pad_num = 8 - (price).count
        let percent_change_24hr = ((percent) + "%").padding(toLength: (14 + pad_num), withPad: " ", startingAt: 0) + "$" + String(format:"%.2f",priceOfCrypto!)
        self.detailTextLabel?.text = percent_change_24hr
        if percent_change! >= 0.0 { self.detailTextLabel?.textColor = UIColor(red: 0/255, green: 229/255, blue: 95/255, alpha: 1.0) } else { self.detailTextLabel?.textColor = UIColor(red: 219/255, green: 0/255, blue: 47/255, alpha: 1.0) }
        self.detailTextLabel?.alpha = 0.7
        self.detailTextLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
            //            let padded_text = (global.cryptoCurrencies[indexPath.row].rank).padding(toLength: 8, withPad: " ", startingAt: 0) + ("(" + global.cryptoCurrencies[indexPath.row].symbol + ") ") + global.cryptoCurrencies[indexPath.row].name
        self.textLabel?.text = (ranking).padding(toLength: 8, withPad: " ", startingAt: 0) + name
        self.textLabel?.textColor = UIColor.init(red: 189.0/255, green: 199.0/255, blue: 193.0/55, alpha: 1.0)
        self.textLabel?.font = UIFont.systemFont(ofSize: 15)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
