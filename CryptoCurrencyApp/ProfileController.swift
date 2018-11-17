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
    var price_label:UILabel!
    var name_label:UILabel!
    var percent_change_label:UILabel!
    var rank_label:UILabel!
    let padding: CGFloat = 10

    var this_crypto:Crypto?{
        didSet{
            if let c = this_crypto {
                let priceOfCrypto = Double(c.price_usd)
                let percentChange = Double(c.percent_change_24h)

                rank_label.text = c.rank
                name_label.text = c.name
                price_label.text = "$" + String(format:"%.2f",priceOfCrypto!)
                percent_change_label.text = c.percent_change_24h + "%"
                if percentChange! >= 0.0 { percent_change_label.textColor = UIColor(red: 0/255, green: 229/255, blue: 95/255, alpha: 1.0) } else { percent_change_label.textColor = UIColor(red: 219/255, green: 0/255, blue: 47/255, alpha: 1.0) }
                setNeedsLayout()
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(red: 40.0/255, green: 50.0/255, blue: 72.0/255, alpha: 1)
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.white.cgColor
        
        rank_label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        rank_label.textAlignment = .left
        rank_label.textColor = UIColor.white
        rank_label.backgroundColor = .clear
        contentView.addSubview(rank_label)
        
        name_label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        name_label.textAlignment = .left
        name_label.textColor = UIColor.init(red: 189.0/255, green: 199.0/255, blue: 193.0/55, alpha: 1.0)
        name_label.backgroundColor = .clear
        contentView.addSubview(name_label)
        
        price_label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        price_label.textAlignment = .right
        price_label.textColor = UIColor.white
        price_label.backgroundColor = .clear
        price_label.alpha = 0.7
        price_label.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        contentView.addSubview(price_label)

        percent_change_label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        percent_change_label.textAlignment = .right
        percent_change_label.backgroundColor = .clear
        percent_change_label.alpha = 0.7
        percent_change_label.font = UIFont(name: "HelveticaNeue-Bold", size: 15)
        contentView.addSubview(percent_change_label)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        rank_label.frame = CGRect(x: padding, y: 0, width: (frame.width - padding), height: frame.height)
        name_label.frame = CGRect(x: (rank_label.frame.minX + (padding*3)), y: 0, width: (frame.width - (rank_label.frame.minX + (padding*3))), height: frame.height)
        price_label.frame = CGRect(x: 0, y: 0, width: frame.width - padding, height: frame.height/2)
        percent_change_label.frame = CGRect(x: 0, y: price_label.frame.maxY, width: frame.width - padding, height: frame.height/2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
