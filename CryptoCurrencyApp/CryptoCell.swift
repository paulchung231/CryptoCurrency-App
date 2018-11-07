//
//  CryptoCell.swift
//  TestApp
//
//  Created by Paul Chung on 11/3/18.
//  Copyright © 2018 Paul Chung. All rights reserved.
//

import Foundation
import UIKit

class CryptoCell: UITableViewCell{
    var cryptoDetails:Crypto?
    static let identifier = "CryptoCell"
    let img_cell = UIImageView()
    let label_price = UILabel()
    let label_name = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        img_cell.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
        //        let priceOfCrypto = Double(cryptoCurrencies[indexPath.row].price_usd)
        //
        //        //formating the cells
        //        if let this_cell = cell {
        //            this_cell.detailTextLabel?.text = "$" + String(format:"%.2f",priceOfCrypto!)
        //            this_cell.detailTextLabel?.textColor = UIColor.white
        //            this_cell.textLabel?.text = cryptoCurrencies[indexPath.row].name
        //            this_cell.textLabel?.textColor = UIColor.init(red: 189.0/255, green: 199.0/255, blue: 193.0/55, alpha: 1.0)
        //            this_cell.textLabel?.font = UIFont.systemFont(ofSize: 15)
        //            this_cell.backgroundColor = UIColor.init(red: 18.0/255, green: 28.0/255, blue: 50.0/255, alpha: 1)
        //            this_cell.layer.borderWidth = 0.3
        //            this_cell.layer.borderColor = UIColor.black.cgColor
        //            this_cell.selectedBackgroundView = bgColorView
        //
        //            this_cell.accessoryType = .detailDisclosureButton
        //
        //        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func pass_this_crypto(crypto: Crypto){
        cryptoDetails = crypto
    }
}
